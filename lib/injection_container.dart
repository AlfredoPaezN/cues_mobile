import 'package:virtual_cues/core/constants/constants.dart';
import 'package:virtual_cues/core/http/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> initLocator() async {
// API Client
  locator
    ..registerLazySingleton<Dio>(() => dioClient)

// Core
    ..registerSingleton(Constants.new);

// DataSources
  // ..registerLazySingleton<virtual_cuesApi>(() => virtual_cuesApi(locator()))

// Repositories
  // ..registerLazySingleton<BreedRepository>(
  //   () => BreedRepositoryImpl(virtual_cuesApi: locator()),
  // )

// UseCases
  // ..registerLazySingleton<Getvirtual_cuesUseCase>(
  //   () => Getvirtual_cuesUseCase(locator()),
  // )

// Cubits
  // ..registerFactory(() => BreedCubit(locator()));
}
