import 'package:get_it/get_it.dart';
import 'package:my_store/core/app/app_cubit/cubit/app_cubit.dart';

final getIt = GetIt.instance;

Future<void> setGetIt() async {
  // app cubit for theme and language
  getIt.registerFactory<AppCubit>(AppCubit.new);
}
