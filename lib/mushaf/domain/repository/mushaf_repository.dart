import 'package:quran/mushaf/domain/models/ayah_model.dart';
import 'package:quran/mushaf/domain/models/reader_model.dart';
import 'package:quran/mushaf/domain/models/surah_model.dart';

abstract class MushafRepository
{
  Future<List<SurahModel>> getSurahs();
  Future<List<ReaderModel>> getReaders();
  Future<List<SurahModel>> getMushafByReader(String identifier);
  Future<String> getSurahAudio(int surahNumber,String readerIdentifier);
}