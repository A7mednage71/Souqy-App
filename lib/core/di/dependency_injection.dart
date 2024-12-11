import 'package:get_it/get_it.dart';
import 'package:my_store/core/app/app_cubit/cubit/app_cubit.dart';
import 'package:my_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:my_store/core/app/upload_image/repos/upload_image_repo.dart';
import 'package:my_store/core/networking/api_service.dart';
import 'package:my_store/core/networking/dio_factory.dart';
import 'package:my_store/features/auth/login/data/repos/login_repo.dart';
import 'package:my_store/features/auth/login/presentation/bloc/login_bloc.dart';

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
    );
}
