// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'validate_token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ValidateTokenModel {

@JsonKey(name: "status") int? get status;@JsonKey(name: "code") String? get code;@JsonKey(name: "message") String? get message;
/// Create a copy of ValidateTokenModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidateTokenModelCopyWith<ValidateTokenModel> get copyWith => _$ValidateTokenModelCopyWithImpl<ValidateTokenModel>(this as ValidateTokenModel, _$identity);

  /// Serializes this ValidateTokenModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidateTokenModel&&(identical(other.status, status) || other.status == status)&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,code,message);

@override
String toString() {
  return 'ValidateTokenModel(status: $status, code: $code, message: $message)';
}


}

/// @nodoc
abstract mixin class $ValidateTokenModelCopyWith<$Res>  {
  factory $ValidateTokenModelCopyWith(ValidateTokenModel value, $Res Function(ValidateTokenModel) _then) = _$ValidateTokenModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "status") int? status,@JsonKey(name: "code") String? code,@JsonKey(name: "message") String? message
});




}
/// @nodoc
class _$ValidateTokenModelCopyWithImpl<$Res>
    implements $ValidateTokenModelCopyWith<$Res> {
  _$ValidateTokenModelCopyWithImpl(this._self, this._then);

  final ValidateTokenModel _self;
  final $Res Function(ValidateTokenModel) _then;

/// Create a copy of ValidateTokenModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? code = freezed,Object? message = freezed,}) {
  return _then(_self.copyWith(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ValidateTokenModel].
extension ValidateTokenModelPatterns on ValidateTokenModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ValidateTokenModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ValidateTokenModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ValidateTokenModel value)  $default,){
final _that = this;
switch (_that) {
case _ValidateTokenModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ValidateTokenModel value)?  $default,){
final _that = this;
switch (_that) {
case _ValidateTokenModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  int? status, @JsonKey(name: "code")  String? code, @JsonKey(name: "message")  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ValidateTokenModel() when $default != null:
return $default(_that.status,_that.code,_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  int? status, @JsonKey(name: "code")  String? code, @JsonKey(name: "message")  String? message)  $default,) {final _that = this;
switch (_that) {
case _ValidateTokenModel():
return $default(_that.status,_that.code,_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "status")  int? status, @JsonKey(name: "code")  String? code, @JsonKey(name: "message")  String? message)?  $default,) {final _that = this;
switch (_that) {
case _ValidateTokenModel() when $default != null:
return $default(_that.status,_that.code,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ValidateTokenModel implements ValidateTokenModel {
  const _ValidateTokenModel({@JsonKey(name: "status") this.status, @JsonKey(name: "code") this.code, @JsonKey(name: "message") this.message});
  factory _ValidateTokenModel.fromJson(Map<String, dynamic> json) => _$ValidateTokenModelFromJson(json);

@override@JsonKey(name: "status") final  int? status;
@override@JsonKey(name: "code") final  String? code;
@override@JsonKey(name: "message") final  String? message;

/// Create a copy of ValidateTokenModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValidateTokenModelCopyWith<_ValidateTokenModel> get copyWith => __$ValidateTokenModelCopyWithImpl<_ValidateTokenModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ValidateTokenModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ValidateTokenModel&&(identical(other.status, status) || other.status == status)&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,code,message);

@override
String toString() {
  return 'ValidateTokenModel(status: $status, code: $code, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ValidateTokenModelCopyWith<$Res> implements $ValidateTokenModelCopyWith<$Res> {
  factory _$ValidateTokenModelCopyWith(_ValidateTokenModel value, $Res Function(_ValidateTokenModel) _then) = __$ValidateTokenModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "status") int? status,@JsonKey(name: "code") String? code,@JsonKey(name: "message") String? message
});




}
/// @nodoc
class __$ValidateTokenModelCopyWithImpl<$Res>
    implements _$ValidateTokenModelCopyWith<$Res> {
  __$ValidateTokenModelCopyWithImpl(this._self, this._then);

  final _ValidateTokenModel _self;
  final $Res Function(_ValidateTokenModel) _then;

/// Create a copy of ValidateTokenModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? code = freezed,Object? message = freezed,}) {
  return _then(_ValidateTokenModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
