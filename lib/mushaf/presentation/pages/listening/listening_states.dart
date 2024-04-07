import 'package:quran/mushaf/domain/models/reader_model.dart';
import 'package:quran/mushaf/domain/models/surah_model.dart';

  class ListeningStates {
  final List<ReaderModel>? readers;
  final List<SurahModel>? surahs;
  final String? surahAudioUrl;
  final String? errorMessage;

  ListeningStates({
    this.readers = const [],
    this.errorMessage,
    this.surahs,
    this.surahAudioUrl
  });

}

class ListeningInitialState extends ListeningStates {}

class ListeningLoadingState extends ListeningStates {}

class ListeningSuccessState extends ListeningStates {
  ListeningSuccessState({super.readers, super.surahs, super.surahAudioUrl});
}

class ListeningErrorState extends ListeningStates {
  ListeningErrorState({super.errorMessage});
}
