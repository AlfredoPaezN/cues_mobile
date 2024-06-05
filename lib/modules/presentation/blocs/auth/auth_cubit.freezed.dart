// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user) autenticate,
    required TResult Function() isLoading,
    required TResult Function() isError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User? user)? autenticate,
    TResult? Function()? isLoading,
    TResult? Function()? isError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user)? autenticate,
    TResult Function()? isLoading,
    TResult Function()? isError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Authenticate value) autenticate,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_isError value) isError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Authenticate value)? autenticate,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_isError value)? isError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Authenticate value)? autenticate,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_isError value)? isError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthenticateImplCopyWith<$Res> {
  factory _$$AuthenticateImplCopyWith(
          _$AuthenticateImpl value, $Res Function(_$AuthenticateImpl) then) =
      __$$AuthenticateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User? user});
}

/// @nodoc
class __$$AuthenticateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthenticateImpl>
    implements _$$AuthenticateImplCopyWith<$Res> {
  __$$AuthenticateImplCopyWithImpl(
      _$AuthenticateImpl _value, $Res Function(_$AuthenticateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$AuthenticateImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$AuthenticateImpl implements _Authenticate {
  const _$AuthenticateImpl({this.user = null});

  @override
  @JsonKey()
  final User? user;

  @override
  String toString() {
    return 'AuthState.autenticate(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticateImpl &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticateImplCopyWith<_$AuthenticateImpl> get copyWith =>
      __$$AuthenticateImplCopyWithImpl<_$AuthenticateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user) autenticate,
    required TResult Function() isLoading,
    required TResult Function() isError,
  }) {
    return autenticate(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User? user)? autenticate,
    TResult? Function()? isLoading,
    TResult? Function()? isError,
  }) {
    return autenticate?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user)? autenticate,
    TResult Function()? isLoading,
    TResult Function()? isError,
    required TResult orElse(),
  }) {
    if (autenticate != null) {
      return autenticate(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Authenticate value) autenticate,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_isError value) isError,
  }) {
    return autenticate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Authenticate value)? autenticate,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_isError value)? isError,
  }) {
    return autenticate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Authenticate value)? autenticate,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_isError value)? isError,
    required TResult orElse(),
  }) {
    if (autenticate != null) {
      return autenticate(this);
    }
    return orElse();
  }
}

abstract class _Authenticate implements AuthState {
  const factory _Authenticate({final User? user}) = _$AuthenticateImpl;

  User? get user;
  @JsonKey(ignore: true)
  _$$AuthenticateImplCopyWith<_$AuthenticateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IsLoadingImplCopyWith<$Res> {
  factory _$$IsLoadingImplCopyWith(
          _$IsLoadingImpl value, $Res Function(_$IsLoadingImpl) then) =
      __$$IsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IsLoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$IsLoadingImpl>
    implements _$$IsLoadingImplCopyWith<$Res> {
  __$$IsLoadingImplCopyWithImpl(
      _$IsLoadingImpl _value, $Res Function(_$IsLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IsLoadingImpl implements _IsLoading {
  const _$IsLoadingImpl();

  @override
  String toString() {
    return 'AuthState.isLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user) autenticate,
    required TResult Function() isLoading,
    required TResult Function() isError,
  }) {
    return isLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User? user)? autenticate,
    TResult? Function()? isLoading,
    TResult? Function()? isError,
  }) {
    return isLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user)? autenticate,
    TResult Function()? isLoading,
    TResult Function()? isError,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Authenticate value) autenticate,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_isError value) isError,
  }) {
    return isLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Authenticate value)? autenticate,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_isError value)? isError,
  }) {
    return isLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Authenticate value)? autenticate,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_isError value)? isError,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading(this);
    }
    return orElse();
  }
}

abstract class _IsLoading implements AuthState {
  const factory _IsLoading() = _$IsLoadingImpl;
}

/// @nodoc
abstract class _$$isErrorImplCopyWith<$Res> {
  factory _$$isErrorImplCopyWith(
          _$isErrorImpl value, $Res Function(_$isErrorImpl) then) =
      __$$isErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$isErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$isErrorImpl>
    implements _$$isErrorImplCopyWith<$Res> {
  __$$isErrorImplCopyWithImpl(
      _$isErrorImpl _value, $Res Function(_$isErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$isErrorImpl implements _isError {
  const _$isErrorImpl();

  @override
  String toString() {
    return 'AuthState.isError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$isErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user) autenticate,
    required TResult Function() isLoading,
    required TResult Function() isError,
  }) {
    return isError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User? user)? autenticate,
    TResult? Function()? isLoading,
    TResult? Function()? isError,
  }) {
    return isError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user)? autenticate,
    TResult Function()? isLoading,
    TResult Function()? isError,
    required TResult orElse(),
  }) {
    if (isError != null) {
      return isError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Authenticate value) autenticate,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_isError value) isError,
  }) {
    return isError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Authenticate value)? autenticate,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_isError value)? isError,
  }) {
    return isError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Authenticate value)? autenticate,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_isError value)? isError,
    required TResult orElse(),
  }) {
    if (isError != null) {
      return isError(this);
    }
    return orElse();
  }
}

abstract class _isError implements AuthState {
  const factory _isError() = _$isErrorImpl;
}
