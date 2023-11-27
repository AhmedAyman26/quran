import 'package:get_it/get_it.dart';
import 'package:quran/mushaf/data/repository/mushaf_repository_impl.dart';
import 'package:quran/mushaf/domain/repository/mushaf_repository.dart';
import 'package:quran/mushaf/domain/use_cases/get_mushaf_by_identifier_use_case.dart';
import 'package:quran/mushaf/domain/use_cases/get_readers_use_case.dart';
import 'package:quran/mushaf/domain/use_cases/get_surahs_use_case.dart';


  final injector = GetIt.instance;

Future<void> init() async {

  // usecases
  injector.registerFactory(() => GetSurahsUseCase(injector()));
  injector.registerFactory(() => GetReadersUseCase(injector()));
  injector.registerFactory(() => GetMushafByReaderUseCase(injector()));

  // repository
  injector.registerLazySingleton<MushafRepository>(() => MushafRepositoryImpl(
  ));


}
