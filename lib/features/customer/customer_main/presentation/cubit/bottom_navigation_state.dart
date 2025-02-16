part of 'bottom_navigation_cubit.dart';

@freezed
class BottomNavigationState with _$BottomNavigationState {
  const factory BottomNavigationState.home() = HomeState;
  const factory BottomNavigationState.categories() = CategoriesState;
  const factory BottomNavigationState.favorites() = FavoritesState;
  const factory BottomNavigationState.profile() = ProfileState;
}
