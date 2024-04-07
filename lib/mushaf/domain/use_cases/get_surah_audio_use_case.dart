import 'package:quran/mushaf/domain/repository/mushaf_repository.dart';

class GetSurahAudioUseCase {
  final MushafRepository _mushafRepository;

  GetSurahAudioUseCase(this._mushafRepository);

  Future<String> call(int surahNumber,String readerIdentifier)async
  {
    return await _mushafRepository.getSurahAudio(surahNumber,readerIdentifier);
  }
}