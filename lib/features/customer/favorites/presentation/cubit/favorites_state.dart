part of 'favorites_cubit.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState.initial() = _Initial;
  const factory FavoritesState.loading() = loadFavorites;
  const factory FavoritesState.failure() = _Failure;
  const factory FavoritesState.scucess(
    List<FavoritesModel> favoritesProducts,
  ) = _Success;
}
