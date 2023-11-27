import 'package:quran/mushaf/domain/models/surah_model.dart';
import 'package:quran/mushaf/domain/repository/mushaf_repository.dart';

class GetMushafByReaderUseCase
{
  final MushafRepository _mushafRepository;

  GetMushafByReaderUseCase(this._mushafRepository);

  Future<List<SurahModel>> call(String identifier)async
  {
    return await _mushafRepository.getMushafByReader(identifier);
  }
}