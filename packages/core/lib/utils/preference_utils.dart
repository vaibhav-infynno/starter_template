import 'dart:async' show Future;

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<Box> get _instance async => _box ??= await _openBox();
Box? _box;

Box? _boxInstance;

/// In case the developer does not explicitly call the init() function.
bool _initCalled = false;

/// Initialize the Hive box
/// in the State object's initState() function.
Future<Box?> initHive() async {
  _initCalled = true;
  _boxInstance = await _instance;
  return _boxInstance;
}

/// Helper function to open the Hive box
Future<Box> _openBox() async {
  await Hive.initFlutter();
  return await Hive.openBox('prefs');
}

/// Best to clean up by calling this function
/// in the State object's dispose() function.
void dispose() async {
  _box = null;
  _boxInstance = null;
  await Hive.close();
}

void isPreferenceReady() {
  assert(
    _initCalled,
    "Prefs.init() must be called first in an initState() preferably!",
  );
  assert(_boxInstance != null, "Hive box not ready yet!");
}

/// Returns all keys in the persistent storage.
Set<String> getKeys() {
  isPreferenceReady();
  return _boxInstance?.keys.cast<String>().toSet() ?? <String>{};
}

/// Returns a Future.
Future<Set<String>> getKeysF() async {
  Set<String> value;
  if (_boxInstance == null) {
    Box box = await _instance;
    value = box.keys.cast<String>().toSet();
  } else {
    value = getKeys();
  }
  return value;
}

/// Reads a value of any type from persistent storage.
dynamic getDynamic(String key) {
  isPreferenceReady();
  return _boxInstance?.get(key);
}

/// Returns a Future.
Future<dynamic> getDynamicF(String key) async {
  dynamic value;
  if (_boxInstance == null) {
    var box = await _instance;
    value = box.get(key);
  } else {
    value = getDynamic(key);
  }
  return value;
}

bool getBool(String key, [bool? defValue]) {
  isPreferenceReady();
  return _boxInstance?.get(key) as bool? ?? defValue ?? false;
}

/// Returns a Future.
Future<bool> getBoolF(String key, [bool? defValue]) async {
  bool value;
  if (_boxInstance == null) {
    var box = await _instance;
    value = box.get(key) as bool? ?? defValue ?? false;
  } else {
    value = getBool(key);
  }
  return value;
}

int getInt(String key, [int? defValue]) {
  isPreferenceReady();
  return _boxInstance?.get(key) as int? ?? defValue ?? 0;
}

/// Returns a Future.
Future<int> getIntF(String key, [int? defValue]) async {
  int value;
  if (_boxInstance == null) {
    var box = await _instance;
    value = box.get(key) as int? ?? defValue ?? 0;
  } else {
    value = getInt(key);
  }
  return value;
}

double getDouble(String key, [double? defValue]) {
  isPreferenceReady();
  return _boxInstance?.get(key) as double? ?? defValue ?? 0.0;
}

/// Returns a Future.
Future<double> getDoubleF(String key, [double? defValue]) async {
  double value;
  if (_boxInstance == null) {
    var box = await _instance;
    value = box.get(key) as double? ?? defValue ?? 0.0;
  } else {
    value = getDouble(key);
  }
  return value;
}

String getString(String key, [String? defValue]) {
  isPreferenceReady();
  return _boxInstance?.get(key) as String? ?? defValue ?? "";
}

/// Returns a Future.
Future<String> getStringF(String key, [String? defValue]) async {
  String value;
  if (_boxInstance == null) {
    var box = await _instance;
    value = box.get(key) as String? ?? defValue ?? "";
  } else {
    value = getString(key);
  }
  return value;
}

List<String> getStringList(String key, [List<String>? defValue]) {
  isPreferenceReady();
  return _boxInstance?.get(key) as List<String>? ?? defValue ?? [];
}

/// Returns a Future.
Future<List<String>> getStringListF(
  String key, [
  List<String>? defValue,
]) async {
  List<String> value;
  if (_boxInstance == null) {
    var box = await _instance;
    value = box.get(key) as List<String>? ?? defValue ?? [];
  } else {
    value = getStringList(key);
  }
  return value;
}

/// Saves a boolean [value] to persistent storage in the background.
/// If [value] is null, this is equivalent to calling [remove()] on the [key].
Future<bool> setBool(String key, bool value) async {
  var box = await _instance;
  await box.put(key, value);
  return true;
}

/// Saves an integer [value] to persistent storage in the background.
/// If [value] is null, this is equivalent to calling [remove()] on the [key].
Future<bool> setInt(String key, int value) async {
  var box = await _instance;
  await box.put(key, value);
  return true;
}

/// Saves a double [value] to persistent storage in the background.
/// If [value] is null, this is equivalent to calling [remove()] on the [key].
Future<bool> setDouble(String key, double value) async {
  var box = await _instance;
  await box.put(key, value);
  return true;
}

/// Saves a string [value] to persistent storage in the background.
/// If [value] is null, this is equivalent to calling [remove()] on the [key].
Future<bool> setString(String key, String value) async {
  var box = await _instance;
  await box.put(key, value);
  return true;
}

/// Saves a list of strings [value] to persistent storage in the background.
/// If [value] is null, this is equivalent to calling [remove()] on the [key].
Future<bool> setStringList(String key, List<String> value) async {
  var box = await _instance;
  await box.put(key, value);
  return true;
}

/// Removes an entry from persistent storage.
Future<bool> remove(String key) async {
  var box = await _instance;
  await box.delete(key);
  return true;
}

/// Completes with true once the user preferences for the app have been cleared.
Future<bool> clear() async {
  var box = await _instance;
  await box.clear();
  return true;
}

ValueListenable<Box> listenable([List<String>? keys]) {
  isPreferenceReady();
  return _boxInstance!.listenable(keys: keys);
}
