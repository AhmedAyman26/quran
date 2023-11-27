import 'package:dio/dio.dart';
import 'package:quran/mushaf/data/mapper/api_reader_mapper.dart';
import 'package:quran/mushaf/data/mapper/api_surah_model_mapper.dart';
import 'package:quran/mushaf/data/models/api_mushaf_model.dart';
import 'package:quran/mushaf/data/models/api_quran_editions.dart';
import 'package:quran/mushaf/domain/models/reader_model.dart';
import 'package:quran/mushaf/domain/models/surah_model.dart';
import 'package:quran/mushaf/domain/repository/mushaf_repository.dart';
import 'package:quran/mushaf/utils/constants.dart';

class MushafRepositoryImpl extends MushafRepository {
  final Dio dio = Dio();

  @override
  Future<List<SurahModel>> getSurahs() async {
    final request = await dio.get(ApiConstants.getSurahsPath);
    if (request.data != null) {
      final result = ApIMushafModel.fromJson(request.data);
      if (result.code == 200) {
        return result.data?.surahs?.map((e) => e.map()).toList() ?? [];
      } else {
        throw Exception();
      }
    }
    throw Exception();
  }


  @override
  Future<List<ReaderModel>> getReaders() async {
    final request = await dio.get(
      ApiConstants.getReadersPath,
      queryParameters: {'format': "audio", "language": "ar"},
    );
    if (request.data != null) {
      final result = ApiReadersModel.fromJson(request.data);
      if (result.code == 200) {
        return result.data?.map((e) => e.map()).toList() ?? [];
      } else {
        throw Exception();
      }
    }
    throw Exception();
  }

  @override
  Future<List<SurahModel>> getMushafByReader(String identifier)async {
    final request = await dio.get(
      "${ApiConstants.getReaderMushafPath}/$identifier",
    );
    if (request.data != null) {
      final result = ApIMushafModel.fromJson(request.data);
      if (result.code == 200) {
        return result.data?.surahs?.map((e) => e.map()).toList() ?? [];
      } else {
        throw Exception();
      }
    }
    throw Exception();
  }
}
