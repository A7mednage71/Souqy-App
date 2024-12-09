import 'package:get_it/get_it.dart';
import 'package:my_store/core/app/app_cubit/cubit/app_cubit.dart';
import 'package:my_store/core/networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setGetIt() async {
  // create dio object
  final dio = DioFactory.getDio();
  // app cubit for theme and language
  getIt.registerFactory<AppCubit>(AppCubit.new);
}
