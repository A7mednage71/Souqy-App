import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/core/services/hive_database/hive_database.dart';
import 'package:my_store/features/customer/favorites/data/models/favorites_model.dart';

part 'favorites_cubit.freezed.dart';
part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState.initial());

  Future<void> toggleFavorites({
    required FavoritesModel favoritesModel,
  }) async {
    final index = HiveDatabase.favoritesBox!.values
        .toList()
        .indexWhere((id) => id.id == favoritesModel.id);

    if (index != -1) {
      await HiveDatabase.favoritesBox!.deleteAt(index);
    } else {
      await HiveDatabase.favoritesBox!.add(favoritesModel);
    }

    final favorites = HiveDatabase.favoritesBox!.values.toList();
    emit(FavoritesState.scucess(favorites));
  }

  void getFavoritesProducts() {
    emit(const FavoritesState.loading());
    final favorites = HiveDatabase.favoritesBox!.values.toList();
    emit(FavoritesState.scucess(favorites));
  }

  bool isFavorite({required String productId}) {
    final favorites = HiveDatabase.favoritesBox!.values.toList();
    return favorites.any((id) => id.id == productId);
  }
}
