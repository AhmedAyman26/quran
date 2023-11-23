import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/mushaf/domain/use_cases/get_surahs_use_case.dart';
import 'package:quran/mushaf/presentation/pages/surahs_states.dart';

class SurahsCubit extends Cubit<SurahsStates>
{
  final GetSurahsUseCase _getSurahsUseCase;
  SurahsCubit(this._getSurahsUseCase):super(SurhasInitialState());

  static SurahsCubit get(context)=>BlocProvider.of(context);

  void getSurahs()async
  {
    emit(SurhasLoadingState());
    final surahs= await _getSurahsUseCase();
    emit(SurhasSuccessState(surahs: surahs));
  }
}