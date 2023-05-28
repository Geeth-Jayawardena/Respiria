import 'package:resperia/repositories/auth_repository.dart';
import 'package:resperia/repositories/predict_repository.dart';
import 'package:resperia/routes.gr.dart';
import 'package:get_it/get_it.dart';

import 'api/dio_client.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<DioClient>(
    () => DioClient(),
  );
  getIt.registerLazySingleton<AppRouter>(
    () => AppRouter(),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(),
  );
  getIt.registerLazySingleton<PredictionRepository>(
    () => PredictionRepository(),
  );
}
