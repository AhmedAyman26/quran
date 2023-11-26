import 'package:get_it/get_it.dart';
import 'package:quran/mushaf/data/data_Source.dart';
import 'package:quran/mushaf/domain/repository/mushaf_repository.dart';
import 'package:quran/mushaf/domain/use_cases/get_readers_use_case.dart';
import 'package:quran/mushaf/domain/use_cases/get_surahs_use_case.dart';


  final injector = GetIt.instance;

Future<void> init() async {

  // usecases
  injector.registerFactory(() => GetSurahsUseCase(injector()));
  injector.registerFactory(() => GetReadersUseCase(injector()));

  // repository
  injector.registerLazySingleton<MushafRepository>(() => MushafRepositoryImpl(
  ));


}
