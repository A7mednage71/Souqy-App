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
import 'package:my_store/features/admin/categories/presentation/bloc/update_category/update_category_bloc.dart';
import 'package:my_store/features/admin/dashboard/data/repos/dashboard_repo.dart';
import 'package:my_store/features/admin/dashboard/views/bloc/number_of_categories/fetch_number_of_categories_bloc.dart';
import 'package:my_store/features/admin/dashboard/views/bloc/number_of_products/fetch_number_of_products_bloc.dart';
import 'package:my_store/features/admin/dashboard/views/bloc/number_of_users/fetch_number_of_users_bloc.dart';
import 'package:my_store/features/admin/notifications/data/repos/notifications_repo.dart';
import 'package:my_store/features/admin/notifications/presentation/bloc/add_notification/add_notifications_bloc.dart';
import 'package:my_store/features/admin/notifications/presentation/bloc/get_notifications/get_notifications_bloc.dart';
import 'package:my_store/features/admin/notifications/presentation/bloc/send_notification/send_notification_bloc.dart';
import 'package:my_store/features/admin/products/data/repos/products_repo.dart';
import 'package:my_store/features/admin/products/presentation/bloc/create_product/create_product_bloc.dart';
import 'package:my_store/features/admin/products/presentation/bloc/delete_product/delete_product_bloc.dart';
import 'package:my_store/features/admin/products/presentation/bloc/get_products/get_products_bloc.dart';
import 'package:my_store/features/admin/products/presentation/bloc/update_product/update_product_bloc.dart';
import 'package:my_store/features/admin/users/data/repos/users_repo.dart';
import 'package:my_store/features/admin/users/presentation/bloc/delete_user/delete_user_bloc.dart';
import 'package:my_store/features/admin/users/presentation/bloc/get_users/get_users_bloc.dart';
import 'package:my_store/features/auth/login/data/repos/login_repo.dart';
import 'package:my_store/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:my_store/features/auth/register/data/repos/sighn_up_repo.dart';
import 'package:my_store/features/auth/register/presentation/bloc/sighn_up_bloc.dart';
import 'package:my_store/features/customer/category_products/data/repos/category_products.dart';
import 'package:my_store/features/customer/category_products/presentation/bloc/get_category_products/get_category_products_bloc.dart';
import 'package:my_store/features/customer/customer_home/data/repos/customer_home_repo.dart';
import 'package:my_store/features/customer/customer_home/presentation/bloc/get_customer_categories/get_customer_categories_bloc.dart';
import 'package:my_store/features/customer/customer_home/presentation/bloc/get_first_ten_products/get_first_ten_products_bloc.dart';
import 'package:my_store/features/customer/customer_main/presentation/cubit/bottom_navigation_cubit.dart';
import 'package:my_store/features/customer/profile/data/repos/profile_repo.dart';
import 'package:my_store/features/customer/profile/presentation/bloc/get_user_profile/get_user_profile_bloc.dart';
import 'package:my_store/features/customer/search/data/repos/search_products_repo.dart';
import 'package:my_store/features/customer/search/presentation/bloc/search_products/search_products_bloc.dart';
import 'package:my_store/features/customer/view_all_products/presentation/bloc/get_all_products/get_all_products_with_pagination_bloc.dart';

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
    )
    // update category
    ..registerFactory<UpdateCategoryBloc>(
      () => UpdateCategoryBloc(getIt<CategoriesRepo>()),
    )
    // get all products
    // products repo
    ..registerLazySingleton<ProductsRepo>(
      () => ProductsRepo(getIt<ApiService>()),
    )
    ..registerFactory<GetProductsBloc>(
      () => GetProductsBloc(getIt<ProductsRepo>()),
    )
    ..registerFactory<CreateProductBloc>(
      () => CreateProductBloc(getIt<ProductsRepo>()),
    )
    ..registerFactory<DeleteProductBloc>(
      () => DeleteProductBloc(getIt<ProductsRepo>()),
    )
    ..registerFactory<UpdateProductBloc>(
      () => UpdateProductBloc(getIt<ProductsRepo>()),
    )
    // get all users
    // users repo
    ..registerLazySingleton<UsersRepo>(
      () => UsersRepo(getIt<ApiService>()),
    )
    ..registerFactory<GetUsersBloc>(
      () => GetUsersBloc(getIt<UsersRepo>()),
    )
    ..registerFactory<DeleteUserBloc>(
      () => DeleteUserBloc(getIt<UsersRepo>()),
    )
    // get all notifications
    // notifications repository
    ..registerLazySingleton<NotificationsRepo>(
      NotificationsRepo.new,
    )
    ..registerFactory<AddNotificationsBloc>(
      AddNotificationsBloc.new,
    )
    ..registerFactory<GetNotificationsBloc>(
      GetNotificationsBloc.new,
    )
    ..registerFactory<SendNotificationBloc>(
      () => SendNotificationBloc(getIt<NotificationsRepo>()),
    )
    // customer Bottom Nav Bar cubit
    ..registerFactory<BottomNavigationCubit>(
      BottomNavigationCubit.new,
    )
    // customer profile repo and bloc
    ..registerLazySingleton(() => ProfileRepo(getIt<ApiService>()))
    ..registerFactory(() => GetUserProfileBloc(getIt<ProfileRepo>()))

    // start in customer home
    // customer home repo and bloc
    ..registerLazySingleton(() => CustomerHomeRepo(getIt<ApiService>()))
    ..registerFactory(
      () => GetCustomerCategoriesBloc(getIt<CustomerHomeRepo>()),
    )
    ..registerFactory(
      () => GetFirstTenProductsBloc(getIt<CustomerHomeRepo>()),
    )
    // get products by category
    ..registerLazySingleton(() => CategoryProductsRepo(getIt<ApiService>()))
    ..registerFactory(
      () => GetCategoryProductsBloc(getIt<CategoryProductsRepo>()),
    )
    ..registerFactory(
      () => GetAllProductsWithPaginationBloc(getIt<CustomerHomeRepo>()),
    )
    ..registerLazySingleton(() => SearchProductsRepo(getIt<ApiService>()))
    ..registerFactory(() => SearchProductsBloc(getIt<SearchProductsRepo>()));
}
