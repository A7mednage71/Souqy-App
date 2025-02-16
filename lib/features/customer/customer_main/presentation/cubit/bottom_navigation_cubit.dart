import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/core/enums/bottom_nav_bar_items.dart';

part 'bottom_navigation_cubit.freezed.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(const BottomNavigationState.home());
  BottomNavBarItems selectedBottomNavBar = BottomNavBarItems.home;

  void navigateToHome() {
    selectedBottomNavBar = BottomNavBarItems.home;
    emit(const BottomNavigationState.home());
  }

  void navigateToCategories() {
    selectedBottomNavBar = BottomNavBarItems.categories;
    emit(const BottomNavigationState.categories());
  }

  void navigateToFavorites() {
    selectedBottomNavBar = BottomNavBarItems.favorites;
    emit(const BottomNavigationState.favorites());
  }

  void navigateToProfile() {
    selectedBottomNavBar = BottomNavBarItems.profile;
    emit(const BottomNavigationState.profile());
  }
}
