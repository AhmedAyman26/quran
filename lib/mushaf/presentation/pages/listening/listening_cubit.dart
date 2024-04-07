import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/mushaf/domain/models/surah_model.dart';
import 'package:quran/mushaf/domain/use_cases/get_mushaf_by_identifier_use_case.dart';
import 'package:quran/mushaf/domain/use_cases/get_readers_use_case.dart';
import 'package:quran/mushaf/domain/use_cases/get_surah_audio_use_case.dart';
import 'package:quran/mushaf/presentation/pages/listening/listening_states.dart';

class ListeningCubit extends Cubit<ListeningStates>
{
  final GetReadersUseCase _getReadersUseCase;
  final GetMushafByReaderUseCase _getMushafByReaderUseCase;
  final GetSurahAudioUseCase _getSurahAudioUseCase;
  ListeningCubit(this._getReadersUseCase, this._getMushafByReaderUseCase, this._getSurahAudioUseCase):super(ListeningInitialState());

  static ListeningCubit get(context)=>BlocProvider.of(context);

  void getReaders()async
  {
    emit(ListeningLoadingState());
    try {
      final readers = await _getReadersUseCase();
      emit(ListeningSuccessState(readers: readers));
    }
    catch(e)
    {
      emit(ListeningErrorState(errorMessage:e.toString()));
    }
  }

  void getMushafByReader(String identifier)async
  {
    emit(ListeningLoadingState());
    try
    {
      final surahs=await _getMushafByReaderUseCase(identifier);
      emit(ListeningSuccessState(surahs: surahs));
    }catch(e)
    {
      emit(ListeningErrorState(errorMessage: e.toString()));
    }
  }

  void getSurahAudio({required SurahModel surah, required String readerIdentifier}) async {
    emit(ListeningLoadingState());
    try {
      final surahAudio = await _getSurahAudioUseCase.call(surah.number??0,readerIdentifier);
      emit(ListeningSuccessState(surahAudioUrl: surahAudio));
    }catch(e)
    {
      emit(ListeningErrorState(errorMessage: e.toString()));
    }
  }
}