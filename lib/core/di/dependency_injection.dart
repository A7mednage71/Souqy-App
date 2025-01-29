import 'package:get_it/get_it.dart';
import 'package:my_store/core/app/app_cubit/cubit/app_cubit.dart';
import 'package:my_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:my_store/core/app/upload_image/repos/upload_image_repo.dart';
import 'package:my_store/core/networking/api_service.dart';
import 'package:my_store/core/networking/dio_factory.dart';
import 'package:my_store/features/admin/categories/data/repos/categories_repo.dart';
import 'package:my_store/features/admin/categories/presentation/bloc/create_category/create_category_bloc.dart';
import 'package:my_store/features/admin/categories/presentation/bloc/delete_category/delete_category_bloc.dart';
import 'package:my_store/features/admin/categories/presentation/bloc/get_categories/get_categories_bloc.dart';
import 'package:my_store/features/admin/dashboard/data/repos/dashboard_repo.dart';
import 'package:my_store/features/admin/dashboard/views/bloc/number_of_categories/fetch_number_of_categories_bloc.dart';
import 'package:my_store/features/admin/dashboard/views/bloc/number_of_products/fetch_number_of_products_bloc.dart';
import 'package:my_store/features/admin/dashboard/views/bloc/number_of_users/fetch_number_of_users_bloc.dart';
import 'package:my_store/features/auth/login/data/repos/login_repo.dart';
import 'package:my_store/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:my_store/features/auth/register/data/repos/sighn_up_repo.dart';
import 'package:my_store/features/auth/register/presentation/bloc/sighn_up_bloc.dart';

final getIt = GetIt.instance;

Future<void> setGetIt() async {
  // create dio object
  final dio = await DioFactory.getDio();

  getIt
    // app cubit for theme and language
    ..registerFactory<AppCubit>(AppCubit.new)
    // api service
    ..registerLazySingleton<ApiService>(() => ApiService(dio))
    // login bloc
    ..registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiService>()))
    ..registerFactory<LoginBloc>(() => LoginBloc(getIt<LoginRepo>()))
    // upload image cubit
    ..registerLazySingleton<UploadImageRepo>(
      () => UploadImageRepo(getIt<ApiService>()),
    )
    ..registerFactory<UploadImageCubit>(
      () => UploadImageCubit(getIt<UploadImageRepo>()),
    )
    // signup bloc
    ..registerLazySingleton<SighnUpRepo>(() => SighnUpRepo(getIt<ApiService>()))
    ..registerFactory<SighnUpBloc>(() => SighnUpBloc(getIt<SighnUpRepo>()))
    // dashboard blocs / repo
    ..registerLazySingleton<DashboardRepo>(
      () => DashboardRepo(getIt<ApiService>()),
    )
    ..registerFactory<FetchNumberOfProductsBloc>(
      () => FetchNumberOfProductsBloc(getIt<DashboardRepo>()),
    )
    ..registerFactory<FetchNumberOfCategoriesBloc>(
      () => FetchNumberOfCategoriesBloc(getIt<DashboardRepo>()),
    )
    ..registerFactory<FetchNumberOfUsersBloc>(
      () => FetchNumberOfUsersBloc(getIt<DashboardRepo>()),
    )
    // get all categories
    ..registerLazySingleton<CategoriesRepo>(
      () => CategoriesRepo(getIt<ApiService>()),
    )
    ..registerFactory<GetCategoriesBloc>(
      () => GetCategoriesBloc(getIt<CategoriesRepo>()),
    )
    // create category
    ..registerFactory<CreateCategoryBloc>(
      () => CreateCategoryBloc(getIt<CategoriesRepo>()),
    )
    // delete category
    ..registerFactory<DeleteCategoryBloc>(
      () => DeleteCategoryBloc(getIt<CategoriesRepo>()),
    );
}
