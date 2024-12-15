import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/dashboard/data/repos/dashboard_repo.dart';

part 'fetch_number_of_categories_bloc.freezed.dart';
part 'fetch_number_of_categories_event.dart';
part 'fetch_number_of_categories_state.dart';

class FetchNumberOfCategoriesBloc
    extends Bloc<FetchNumberOfCategoriesEvent, FetchNumberOfCategoriesState> {
  FetchNumberOfCategoriesBloc(this._dashboardRepo)
      : super(const FetchNumberOfCategoriesState.loading()) {
    on<FetchNumberOfCategories>(_fetchNumberOfCategories);
  }
  final DashboardRepo _dashboardRepo;

  FutureOr<void> _fetchNumberOfCategories(
    FetchNumberOfCategories event,
    Emitter<FetchNumberOfCategoriesState> emit,
  ) async {
    emit(const FetchNumberOfCategoriesState.loading());
    final result = await _dashboardRepo.numberOfCategories();
    result.when(
      success: (response) => emit(
        FetchNumberOfCategoriesState.success(response.numberofcategories),
      ),
      failure: (error) =>
          emit(FetchNumberOfCategoriesState.failure(error.errMessages)),
    );
  }
}
