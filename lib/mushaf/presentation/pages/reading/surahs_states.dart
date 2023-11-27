import 'package:quran/mushaf/domain/models/surah_model.dart';

abstract class SurahsStates
{
  final List<SurahModel> surahs;
  final String? errorMessage;

  SurahsStates({this.surahs=const[],this.errorMessage, });
}

class SurahsInitialState extends SurahsStates{
}
class SurahsSuccessState extends SurahsStates
{
  SurahsSuccessState({super.surahs});

}
class SurahsLoadingState extends SurahsStates{}
class SurahsErrorState extends SurahsStates
{
  SurahsErrorState({super.errorMessage});
}