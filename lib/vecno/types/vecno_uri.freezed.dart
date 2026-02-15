// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vecno_uri.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VecnoUriParam {

 String get key; String get value;
/// Create a copy of VecnoUriParam
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VecnoUriParamCopyWith<VecnoUriParam> get copyWith => _$VecnoUriParamCopyWithImpl<VecnoUriParam>(this as VecnoUriParam, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VecnoUriParam&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,key,value);

@override
String toString() {
  return 'VecnoUriParam(key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class $VecnoUriParamCopyWith<$Res>  {
  factory $VecnoUriParamCopyWith(VecnoUriParam value, $Res Function(VecnoUriParam) _then) = _$VecnoUriParamCopyWithImpl;
@useResult
$Res call({
 String key, String value
});




}
/// @nodoc
class _$VecnoUriParamCopyWithImpl<$Res>
    implements $VecnoUriParamCopyWith<$Res> {
  _$VecnoUriParamCopyWithImpl(this._self, this._then);

  final VecnoUriParam _self;
  final $Res Function(VecnoUriParam) _then;

/// Create a copy of VecnoUriParam
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? value = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VecnoUriParam].
extension VecnoUriParamPatterns on VecnoUriParam {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VecnoUriParam value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VecnoUriParam() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VecnoUriParam value)  $default,){
final _that = this;
switch (_that) {
case _VecnoUriParam():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VecnoUriParam value)?  $default,){
final _that = this;
switch (_that) {
case _VecnoUriParam() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VecnoUriParam() when $default != null:
return $default(_that.key,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String value)  $default,) {final _that = this;
switch (_that) {
case _VecnoUriParam():
return $default(_that.key,_that.value);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String value)?  $default,) {final _that = this;
switch (_that) {
case _VecnoUriParam() when $default != null:
return $default(_that.key,_that.value);case _:
  return null;

}
}

}

/// @nodoc


class _VecnoUriParam extends VecnoUriParam {
  const _VecnoUriParam({required this.key, required this.value}): super._();
  

@override final  String key;
@override final  String value;

/// Create a copy of VecnoUriParam
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VecnoUriParamCopyWith<_VecnoUriParam> get copyWith => __$VecnoUriParamCopyWithImpl<_VecnoUriParam>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VecnoUriParam&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,key,value);

@override
String toString() {
  return 'VecnoUriParam(key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class _$VecnoUriParamCopyWith<$Res> implements $VecnoUriParamCopyWith<$Res> {
  factory _$VecnoUriParamCopyWith(_VecnoUriParam value, $Res Function(_VecnoUriParam) _then) = __$VecnoUriParamCopyWithImpl;
@override @useResult
$Res call({
 String key, String value
});




}
/// @nodoc
class __$VecnoUriParamCopyWithImpl<$Res>
    implements _$VecnoUriParamCopyWith<$Res> {
  __$VecnoUriParamCopyWithImpl(this._self, this._then);

  final _VecnoUriParam _self;
  final $Res Function(_VecnoUriParam) _then;

/// Create a copy of VecnoUriParam
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? value = null,}) {
  return _then(_VecnoUriParam(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$VecnoUri {

 Address get address; Amount? get amount; String? get label; String? get message; IList<VecnoUriParam> get others;
/// Create a copy of VecnoUri
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VecnoUriCopyWith<VecnoUri> get copyWith => _$VecnoUriCopyWithImpl<VecnoUri>(this as VecnoUri, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VecnoUri&&(identical(other.address, address) || other.address == address)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.label, label) || other.label == label)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.others, others));
}


@override
int get hashCode => Object.hash(runtimeType,address,amount,label,message,const DeepCollectionEquality().hash(others));



}

/// @nodoc
abstract mixin class $VecnoUriCopyWith<$Res>  {
  factory $VecnoUriCopyWith(VecnoUri value, $Res Function(VecnoUri) _then) = _$VecnoUriCopyWithImpl;
@useResult
$Res call({
 Address address, Amount? amount, String? label, String? message, IList<VecnoUriParam> others
});


$AddressCopyWith<$Res> get address;$AmountCopyWith<$Res>? get amount;

}
/// @nodoc
class _$VecnoUriCopyWithImpl<$Res>
    implements $VecnoUriCopyWith<$Res> {
  _$VecnoUriCopyWithImpl(this._self, this._then);

  final VecnoUri _self;
  final $Res Function(VecnoUri) _then;

/// Create a copy of VecnoUri
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? amount = freezed,Object? label = freezed,Object? message = freezed,Object? others = null,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as Address,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Amount?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,others: null == others ? _self.others : others // ignore: cast_nullable_to_non_nullable
as IList<VecnoUriParam>,
  ));
}
/// Create a copy of VecnoUri
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res> get address {
  
  return $AddressCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of VecnoUri
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountCopyWith<$Res>? get amount {
    if (_self.amount == null) {
    return null;
  }

  return $AmountCopyWith<$Res>(_self.amount!, (value) {
    return _then(_self.copyWith(amount: value));
  });
}
}


/// Adds pattern-matching-related methods to [VecnoUri].
extension VecnoUriPatterns on VecnoUri {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VecnoUri value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VecnoUri() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VecnoUri value)  $default,){
final _that = this;
switch (_that) {
case _VecnoUri():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VecnoUri value)?  $default,){
final _that = this;
switch (_that) {
case _VecnoUri() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Address address,  Amount? amount,  String? label,  String? message,  IList<VecnoUriParam> others)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VecnoUri() when $default != null:
return $default(_that.address,_that.amount,_that.label,_that.message,_that.others);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Address address,  Amount? amount,  String? label,  String? message,  IList<VecnoUriParam> others)  $default,) {final _that = this;
switch (_that) {
case _VecnoUri():
return $default(_that.address,_that.amount,_that.label,_that.message,_that.others);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Address address,  Amount? amount,  String? label,  String? message,  IList<VecnoUriParam> others)?  $default,) {final _that = this;
switch (_that) {
case _VecnoUri() when $default != null:
return $default(_that.address,_that.amount,_that.label,_that.message,_that.others);case _:
  return null;

}
}

}

/// @nodoc


class _VecnoUri extends VecnoUri {
  const _VecnoUri({required this.address, this.amount, this.label, this.message, this.others = const IListConst([])}): super._();
  

@override final  Address address;
@override final  Amount? amount;
@override final  String? label;
@override final  String? message;
@override@JsonKey() final  IList<VecnoUriParam> others;

/// Create a copy of VecnoUri
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VecnoUriCopyWith<_VecnoUri> get copyWith => __$VecnoUriCopyWithImpl<_VecnoUri>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VecnoUri&&(identical(other.address, address) || other.address == address)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.label, label) || other.label == label)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.others, others));
}


@override
int get hashCode => Object.hash(runtimeType,address,amount,label,message,const DeepCollectionEquality().hash(others));



}

/// @nodoc
abstract mixin class _$VecnoUriCopyWith<$Res> implements $VecnoUriCopyWith<$Res> {
  factory _$VecnoUriCopyWith(_VecnoUri value, $Res Function(_VecnoUri) _then) = __$VecnoUriCopyWithImpl;
@override @useResult
$Res call({
 Address address, Amount? amount, String? label, String? message, IList<VecnoUriParam> others
});


@override $AddressCopyWith<$Res> get address;@override $AmountCopyWith<$Res>? get amount;

}
/// @nodoc
class __$VecnoUriCopyWithImpl<$Res>
    implements _$VecnoUriCopyWith<$Res> {
  __$VecnoUriCopyWithImpl(this._self, this._then);

  final _VecnoUri _self;
  final $Res Function(_VecnoUri) _then;

/// Create a copy of VecnoUri
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? amount = freezed,Object? label = freezed,Object? message = freezed,Object? others = null,}) {
  return _then(_VecnoUri(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as Address,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Amount?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,others: null == others ? _self.others : others // ignore: cast_nullable_to_non_nullable
as IList<VecnoUriParam>,
  ));
}

/// Create a copy of VecnoUri
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res> get address {
  
  return $AddressCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of VecnoUri
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountCopyWith<$Res>? get amount {
    if (_self.amount == null) {
    return null;
  }

  return $AmountCopyWith<$Res>(_self.amount!, (value) {
    return _then(_self.copyWith(amount: value));
  });
}
}

// dart format on
