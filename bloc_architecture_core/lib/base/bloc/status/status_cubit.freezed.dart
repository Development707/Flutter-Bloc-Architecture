// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StatusState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double? progress) loading,
    required TResult Function() success,
    required TResult Function(Object error) error,
    required TResult Function() inital,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double? progress)? loading,
    TResult? Function()? success,
    TResult? Function(Object error)? error,
    TResult? Function()? inital,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double? progress)? loading,
    TResult Function()? success,
    TResult Function(Object error)? error,
    TResult Function()? inital,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Inital value) inital,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Inital value)? inital,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Inital value)? inital,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusStateCopyWith<$Res> {
  factory $StatusStateCopyWith(
          StatusState value, $Res Function(StatusState) then) =
      _$StatusStateCopyWithImpl<$Res, StatusState>;
}

/// @nodoc
class _$StatusStateCopyWithImpl<$Res, $Val extends StatusState>
    implements $StatusStateCopyWith<$Res> {
  _$StatusStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double? progress});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$StatusStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = freezed,
  }) {
    return _then(_$LoadingImpl(
      freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$LoadingImpl extends _Loading {
  const _$LoadingImpl([this.progress]) : super._();

  @override
  final double? progress;

  @override
  String toString() {
    return 'StatusState.loading(progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double? progress) loading,
    required TResult Function() success,
    required TResult Function(Object error) error,
    required TResult Function() inital,
  }) {
    return loading(progress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double? progress)? loading,
    TResult? Function()? success,
    TResult? Function(Object error)? error,
    TResult? Function()? inital,
  }) {
    return loading?.call(progress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double? progress)? loading,
    TResult Function()? success,
    TResult Function(Object error)? error,
    TResult Function()? inital,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(progress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Inital value) inital,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Inital value)? inital,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Inital value)? inital,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends StatusState {
  const factory _Loading([final double? progress]) = _$LoadingImpl;
  const _Loading._() : super._();

  double? get progress;
  @JsonKey(ignore: true)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$StatusStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessImpl extends _Success {
  const _$SuccessImpl() : super._();

  @override
  String toString() {
    return 'StatusState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double? progress) loading,
    required TResult Function() success,
    required TResult Function(Object error) error,
    required TResult Function() inital,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double? progress)? loading,
    TResult? Function()? success,
    TResult? Function(Object error)? error,
    TResult? Function()? inital,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double? progress)? loading,
    TResult Function()? success,
    TResult Function(Object error)? error,
    TResult Function()? inital,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Inital value) inital,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Inital value)? inital,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Inital value)? inital,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success extends StatusState {
  const factory _Success() = _$SuccessImpl;
  const _Success._() : super._();
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$StatusStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$ErrorImpl extends _Error {
  const _$ErrorImpl(this.error) : super._();

  @override
  final Object error;

  @override
  String toString() {
    return 'StatusState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double? progress) loading,
    required TResult Function() success,
    required TResult Function(Object error) error,
    required TResult Function() inital,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double? progress)? loading,
    TResult? Function()? success,
    TResult? Function(Object error)? error,
    TResult? Function()? inital,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double? progress)? loading,
    TResult Function()? success,
    TResult Function(Object error)? error,
    TResult Function()? inital,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Inital value) inital,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Inital value)? inital,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Inital value)? inital,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error extends StatusState {
  const factory _Error(final Object error) = _$ErrorImpl;
  const _Error._() : super._();

  Object get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitalImplCopyWith<$Res> {
  factory _$$InitalImplCopyWith(
          _$InitalImpl value, $Res Function(_$InitalImpl) then) =
      __$$InitalImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitalImplCopyWithImpl<$Res>
    extends _$StatusStateCopyWithImpl<$Res, _$InitalImpl>
    implements _$$InitalImplCopyWith<$Res> {
  __$$InitalImplCopyWithImpl(
      _$InitalImpl _value, $Res Function(_$InitalImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitalImpl extends _Inital {
  const _$InitalImpl() : super._();

  @override
  String toString() {
    return 'StatusState.inital()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitalImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double? progress) loading,
    required TResult Function() success,
    required TResult Function(Object error) error,
    required TResult Function() inital,
  }) {
    return inital();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double? progress)? loading,
    TResult? Function()? success,
    TResult? Function(Object error)? error,
    TResult? Function()? inital,
  }) {
    return inital?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double? progress)? loading,
    TResult Function()? success,
    TResult Function(Object error)? error,
    TResult Function()? inital,
    required TResult orElse(),
  }) {
    if (inital != null) {
      return inital();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Inital value) inital,
  }) {
    return inital(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Inital value)? inital,
  }) {
    return inital?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Inital value)? inital,
    required TResult orElse(),
  }) {
    if (inital != null) {
      return inital(this);
    }
    return orElse();
  }
}

abstract class _Inital extends StatusState {
  const factory _Inital() = _$InitalImpl;
  const _Inital._() : super._();
}
