import 'package:quran/mushaf/domain/models/reader_model.dart';
import 'package:quran/mushaf/domain/repository/mushaf_repository.dart';

class GetReadersUseCase
{
  final MushafRepository _mushafRepository;

  GetReadersUseCase(this._mushafRepository);
  Future<List<ReaderModel>> call()async
  {
    return await _mushafRepository.getReaders();
}
}