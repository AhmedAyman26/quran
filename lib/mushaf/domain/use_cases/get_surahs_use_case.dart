import 'package:quran/mushaf/domain/models/surah_model.dart';
import 'package:quran/mushaf/domain/repository/mushaf_repository.dart';

class GetSurahsUseCase
{
  final MushafRepository _mushafRepository;

  GetSurahsUseCase(this._mushafRepository);

  Future<List<SurahModel>> call()async
  {
    return await _mushafRepository.getSurahs();
  }
}