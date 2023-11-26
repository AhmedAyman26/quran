import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/mushaf/domain/use_cases/get_readers_use_case.dart';
import 'package:quran/mushaf/domain/use_cases/get_surahs_use_case.dart';
import 'package:quran/mushaf/presentation/pages/listening/surahs_states.dart';
import 'package:quran/mushaf/presentation/pages/reading/surahs_states.dart';

class ListeningCubit extends Cubit<ListeningStates>
{
  final GetReadersUseCase _getReadersUseCase;
  ListeningCubit(this._getReadersUseCase):super(ListeningInitialState());

  static ListeningCubit get(context)=>BlocProvider.of(context);

  void getReaders()async
  {
    emit(GetReadersLoadingState());
    final readers= await _getReadersUseCase();
    emit(GetReadersSuccessState(readers: readers));
  }
}