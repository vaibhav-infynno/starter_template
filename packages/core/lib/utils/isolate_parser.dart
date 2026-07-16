import 'package:flutter/foundation.dart';

/// Utility class to parse JSON in background isolates.
class IsolateParser {
  /// Parse a single JSON map into an object in a separate isolate
  static Future<T> parse<T>(
    T Function(Map<String, dynamic>) parser,
    Map<String, dynamic> json,
  ) async {
    return compute<_IsolateInput<T>, T>(
      _runParser,
      _IsolateInput(parser, json),
    );
  }

  /// Parse a list of JSON maps into a list of objects in a separate isolate
  static Future<List<T>> parseList<T>(
    T Function(Map<String, dynamic>) parser,
    List<dynamic> listJson,
  ) async {
    return compute<_IsolateListInput<T>, List<T>>(
      _runListParser,
      _IsolateListInput(parser, List<Map<String, dynamic>>.from(listJson)),
    );
  }
}

// Helper class for single object parsing
class _IsolateInput<T> {
  final T Function(Map<String, dynamic>) parser;
  final Map<String, dynamic> json;

  _IsolateInput(this.parser, this.json);
}

// Helper class for list parsing
class _IsolateListInput<T> {
  final T Function(Map<String, dynamic>) parser;
  final List<Map<String, dynamic>> listJson;

  _IsolateListInput(this.parser, this.listJson);
}

// Isolate function for single model parsing
T _runParser<T>(_IsolateInput<T> input) {
  return input.parser(input.json);
}

// Isolate function for list parsing
List<T> _runListParser<T>(_IsolateListInput<T> input) {
  return input.listJson.map(input.parser).toList();
}
