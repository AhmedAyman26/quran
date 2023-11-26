import 'package:quran/mushaf/domain/models/reader_model.dart';
import 'package:quran/mushaf/domain/models/surah_model.dart';

abstract class ListeningStates
{
  final List<ReaderModel>? readers;
  final String? errorMessage;

  ListeningStates( {this.readers=const[],this.errorMessage,});
}
class ListeningInitialState extends ListeningStates{}

class GetReadersLoadingState extends ListeningStates{
  GetReadersLoadingState({super.readers});
}
class GetReadersSuccessState extends ListeningStates {
  GetReadersSuccessState({super.readers});

}

class GetReadersErrorState extends ListeningStates {
  GetReadersErrorState({super.errorMessage});

}
