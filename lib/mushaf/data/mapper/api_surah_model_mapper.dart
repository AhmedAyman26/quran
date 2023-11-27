import 'package:quran/mushaf/data/models/api_mushaf_model.dart';
import 'package:quran/mushaf/domain/models/ayah_model.dart';
import 'package:quran/mushaf/domain/models/surah_model.dart';

extension ApiSurahModelMapper on ApiSurah {
  SurahModel map() {
    return SurahModel(
        name: name ?? "",
        number: number ?? 0,
        ayahs: ayahs?.map((e) => e.map()).toList(),
        revelationType: revelationType);
  }
}

extension ApiAyahModelMapper on ApiAyah {
  AyahModel map() {
    return AyahModel(
        number: number ?? 0, text: text ?? "", sajda: sajda ?? false,audio: audio??'');
  }
}
