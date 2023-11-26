import 'package:quran/mushaf/data/models/api_quran_editions.dart';
import 'package:quran/mushaf/domain/models/reader_model.dart';

extension ApiReaderMapper on ApiReaderData {
  ReaderModel map() {
    return ReaderModel(
        name: name ?? "",
        enName: englishName ?? '',
        identifier: identifier ?? '');
  }
}
