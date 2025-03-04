// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bottom_navigation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BottomNavigationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function() categories,
    required TResult Function() favorites,
    required TResult Function() profile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? home,
    TResult? Function()? categories,
    TResult? Function()? favorites,
    TResult? Function()? profile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function()? categories,
    TResult Function()? favorites,
    TResult Function()? profile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeState value) home,
    required TResult Function(CategoriesState value) categories,
    required TResult Function(FavoritesState value) favorites,
    required TResult Function(ProfileState value) profile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeState value)? home,
    TResult? Function(CategoriesState value)? categories,
    TResult? Function(FavoritesState value)? favorites,
    TResult? Function(ProfileState value)? profile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeState value)? home,
    TResult Function(CategoriesState value)? categories,
    TResult Function(FavoritesState value)? favorites,
    TResult Function(ProfileState value)? profile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomNavigationStateCopyWith<$Res> {
  factory $BottomNavigationStateCopyWith(BottomNavigationState value,
          $Res Function(BottomNavigationState) then) =
      _$BottomNavigationStateCopyWithImpl<$Res, BottomNavigationState>;
}

/// @nodoc
class _$BottomNavigationStateCopyWithImpl<$Res,
        $Val extends BottomNavigationState>
    implements $BottomNavigationStateCopyWith<$Res> {
  _$BottomNavigationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BottomNavigationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$BottomNavigationStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BottomNavigationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HomeStateImpl implements HomeState {
  const _$HomeStateImpl();

  @override
  String toString() {
    return 'BottomNavigationState.home()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function() categories,
    required TResult Function() favorites,
    required TResult Function() profile,
  }) {
    return home();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? home,
    TResult? Function()? categories,
    TResult? Function()? favorites,
    TResult? Function()? profile,
  }) {
    return home?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function()? categories,
    TResult Function()? favorites,
    TResult Function()? profile,
    required TResult orElse(),
  }) {
    if (home != null) {
      return home();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeState value) home,
    required TResult Function(CategoriesState value) categories,
    required TResult Function(FavoritesState value) favorites,
    required TResult Function(ProfileState value) profile,
  }) {
    return home(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeState value)? home,
    TResult? Function(CategoriesState value)? categories,
    TResult? Function(FavoritesState value)? favorites,
    TResult? Function(ProfileState value)? profile,
  }) {
    return home?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeState value)? home,
    TResult Function(CategoriesState value)? categories,
    TResult Function(FavoritesState value)? favorites,
    TResult Function(ProfileState value)? profile,
    required TResult orElse(),
  }) {
    if (home != null) {
      return home(this);
    }
    return orElse();
  }
}

abstract class HomeState implements BottomNavigationState {
  const factory HomeState() = _$HomeStateImpl;
}

/// @nodoc
abstract class _$$CategoriesStateImplCopyWith<$Res> {
  factory _$$CategoriesStateImplCopyWith(_$CategoriesStateImpl value,
          $Res Function(_$CategoriesStateImpl) then) =
      __$$CategoriesStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CategoriesStateImplCopyWithImpl<$Res>
    extends _$BottomNavigationStateCopyWithImpl<$Res, _$CategoriesStateImpl>
    implements _$$CategoriesStateImplCopyWith<$Res> {
  __$$CategoriesStateImplCopyWithImpl(
      _$CategoriesStateImpl _value, $Res Function(_$CategoriesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BottomNavigationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CategoriesStateImpl implements CategoriesState {
  const _$CategoriesStateImpl();

  @override
  String toString() {
    return 'BottomNavigationState.categories()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CategoriesStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function() categories,
    required TResult Function() favorites,
    required TResult Function() profile,
  }) {
    return categories();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? home,
    TResult? Function()? categories,
    TResult? Function()? favorites,
    TResult? Function()? profile,
  }) {
    return categories?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function()? categories,
    TResult Function()? favorites,
    TResult Function()? profile,
    required TResult orElse(),
  }) {
    if (categories != null) {
      return categories();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeState value) home,
    required TResult Function(CategoriesState value) categories,
    required TResult Function(FavoritesState value) favorites,
    required TResult Function(ProfileState value) profile,
  }) {
    return categories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeState value)? home,
    TResult? Function(CategoriesState value)? categories,
    TResult? Function(FavoritesState value)? favorites,
    TResult? Function(ProfileState value)? profile,
  }) {
    return categories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeState value)? home,
    TResult Function(CategoriesState value)? categories,
    TResult Function(FavoritesState value)? favorites,
    TResult Function(ProfileState value)? profile,
    required TResult orElse(),
  }) {
    if (categories != null) {
      return categories(this);
    }
    return orElse();
  }
}

abstract class CategoriesState implements BottomNavigationState {
  const factory CategoriesState() = _$CategoriesStateImpl;
}

/// @nodoc
abstract class _$$FavoritesStateImplCopyWith<$Res> {
  factory _$$FavoritesStateImplCopyWith(_$FavoritesStateImpl value,
          $Res Function(_$FavoritesStateImpl) then) =
      __$$FavoritesStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FavoritesStateImplCopyWithImpl<$Res>
    extends _$BottomNavigationStateCopyWithImpl<$Res, _$FavoritesStateImpl>
    implements _$$FavoritesStateImplCopyWith<$Res> {
  __$$FavoritesStateImplCopyWithImpl(
      _$FavoritesStateImpl _value, $Res Function(_$FavoritesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BottomNavigationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FavoritesStateImpl implements FavoritesState {
  const _$FavoritesStateImpl();

  @override
  String toString() {
    return 'BottomNavigationState.favorites()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FavoritesStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function() categories,
    required TResult Function() favorites,
    required TResult Function() profile,
  }) {
    return favorites();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? home,
    TResult? Function()? categories,
    TResult? Function()? favorites,
    TResult? Function()? profile,
  }) {
    return favorites?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function()? categories,
    TResult Function()? favorites,
    TResult Function()? profile,
    required TResult orElse(),
  }) {
    if (favorites != null) {
      return favorites();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeState value) home,
    required TResult Function(CategoriesState value) categories,
    required TResult Function(FavoritesState value) favorites,
    required TResult Function(ProfileState value) profile,
  }) {
    return favorites(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeState value)? home,
    TResult? Function(CategoriesState value)? categories,
    TResult? Function(FavoritesState value)? favorites,
    TResult? Function(ProfileState value)? profile,
  }) {
    return favorites?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeState value)? home,
    TResult Function(CategoriesState value)? categories,
    TResult Function(FavoritesState value)? favorites,
    TResult Function(ProfileState value)? profile,
    required TResult orElse(),
  }) {
    if (favorites != null) {
      return favorites(this);
    }
    return orElse();
  }
}

abstract class FavoritesState implements BottomNavigationState {
  const factory FavoritesState() = _$FavoritesStateImpl;
}

/// @nodoc
abstract class _$$ProfileStateImplCopyWith<$Res> {
  factory _$$ProfileStateImplCopyWith(
          _$ProfileStateImpl value, $Res Function(_$ProfileStateImpl) then) =
      __$$ProfileStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileStateImplCopyWithImpl<$Res>
    extends _$BottomNavigationStateCopyWithImpl<$Res, _$ProfileStateImpl>
    implements _$$ProfileStateImplCopyWith<$Res> {
  __$$ProfileStateImplCopyWithImpl(
      _$ProfileStateImpl _value, $Res Function(_$ProfileStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BottomNavigationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProfileStateImpl implements ProfileState {
  const _$ProfileStateImpl();

  @override
  String toString() {
    return 'BottomNavigationState.profile()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProfileStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function() categories,
    required TResult Function() favorites,
    required TResult Function() profile,
  }) {
    return profile();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? home,
    TResult? Function()? categories,
    TResult? Function()? favorites,
    TResult? Function()? profile,
  }) {
    return profile?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function()? categories,
    TResult Function()? favorites,
    TResult Function()? profile,
    required TResult orElse(),
  }) {
    if (profile != null) {
      return profile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeState value) home,
    required TResult Function(CategoriesState value) categories,
    required TResult Function(FavoritesState value) favorites,
    required TResult Function(ProfileState value) profile,
  }) {
    return profile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeState value)? home,
    TResult? Function(CategoriesState value)? categories,
    TResult? Function(FavoritesState value)? favorites,
    TResult? Function(ProfileState value)? profile,
  }) {
    return profile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeState value)? home,
    TResult Function(CategoriesState value)? categories,
    TResult Function(FavoritesState value)? favorites,
    TResult Function(ProfileState value)? profile,
    required TResult orElse(),
  }) {
    if (profile != null) {
      return profile(this);
    }
    return orElse();
  }
}

abstract class ProfileState implements BottomNavigationState {
  const factory ProfileState() = _$ProfileStateImpl;
}
