import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/mushaf/domain/use_cases/get_surahs_use_case.dart';

import 'surahs_states.dart';

class SurahsCubit extends Cubit<SurahsStates> {
  final GetSurahsUseCase _getSurahsUseCase;

  SurahsCubit(this._getSurahsUseCase) : super(SurahsInitialState());

  static SurahsCubit get(context) => BlocProvider.of(context);

  void getSurahs() async {
    emit(SurahsLoadingState());
    try {
      final surahs = await _getSurahsUseCase();
      emit(SurahsSuccessState(surahs: surahs));
    } catch (e) {
      emit(SurahsErrorState(errorMessage: e.toString()));
    }
  }

  @override
  void emit(SurahsStates state) {
   if(!isClosed) {
     super.emit(state);
   }
  }
}
