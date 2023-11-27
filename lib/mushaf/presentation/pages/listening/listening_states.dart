import 'package:quran/mushaf/domain/models/reader_model.dart';
import 'package:quran/mushaf/domain/models/surah_model.dart';

abstract class ListeningStates {
  final List<ReaderModel>? readers;
  final List<SurahModel>? surahs;
  final String? errorMessage;

  ListeningStates({
    this.readers = const [],
    this.errorMessage,
    this.surahs
  });
}

class ListeningInitialState extends ListeningStates {}

class GetReadersLoadingState extends ListeningStates {}

class GetReadersSuccessState extends ListeningStates {
  GetReadersSuccessState({super.readers});
}

class GetReadersErrorState extends ListeningStates {
  GetReadersErrorState({super.errorMessage});
}


class GetMushafByReadersLoadingState extends ListeningStates {}

class GetMushafByReadersSuccessState extends ListeningStates {
  GetMushafByReadersSuccessState({super.surahs});
}

class GetMushafByReadersErrorState extends ListeningStates {
  GetMushafByReadersErrorState({super.errorMessage});
}
