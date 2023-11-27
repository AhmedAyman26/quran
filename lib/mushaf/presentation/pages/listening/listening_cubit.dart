import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/mushaf/domain/use_cases/get_mushaf_by_identifier_use_case.dart';
import 'package:quran/mushaf/domain/use_cases/get_readers_use_case.dart';
import 'package:quran/mushaf/domain/use_cases/get_surahs_use_case.dart';
import 'package:quran/mushaf/presentation/pages/listening/listening_states.dart';
import 'package:quran/mushaf/presentation/pages/reading/surahs_states.dart';

class ListeningCubit extends Cubit<ListeningStates>
{
  final GetReadersUseCase _getReadersUseCase;
  final GetMushafByReaderUseCase _getMushafByReaderUseCase;
  ListeningCubit(this._getReadersUseCase, this._getMushafByReaderUseCase):super(ListeningInitialState());

  static ListeningCubit get(context)=>BlocProvider.of(context);

  void getReaders()async
  {
    emit(GetReadersLoadingState());
    try {
      final readers = await _getReadersUseCase();
      emit(GetReadersSuccessState(readers: readers));
    }
    catch(e)
    {
      emit(GetReadersErrorState(errorMessage:e.toString() ));
    }
  }

  void getMushafByReader(String identifier)async
  {
    emit(GetMushafByReadersLoadingState());
    try
    {
      final surahs=await _getMushafByReaderUseCase(identifier);
      emit(GetMushafByReadersSuccessState(surahs: surahs));
    }catch(e)
    {
      emit(GetMushafByReadersErrorState(errorMessage: e.toString()));
    }
  }
}