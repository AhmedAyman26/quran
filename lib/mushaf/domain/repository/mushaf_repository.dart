import 'package:quran/mushaf/domain/models/ayah_model.dart';
import 'package:quran/mushaf/domain/models/reader_model.dart';
import 'package:quran/mushaf/domain/models/surah_model.dart';

abstract class MushafRepository
{
  Future<List<SurahModel>> getSurahs();
  Future<AyahModel> getAyahs();
  Future<List<ReaderModel>> getReaders();
}