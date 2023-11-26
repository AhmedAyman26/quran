import 'package:quran/mushaf/domain/models/surah_model.dart';

abstract class SurahsStates
{
  final List<SurahModel> surahs;

  SurahsStates({this.surahs=const[]});
}

class SurhasInitialState extends SurahsStates{
  SurhasInitialState();
}
class SurhasSuccessState extends SurahsStates
{
  SurhasSuccessState({super.surahs});

}
class SurhasLoadingState extends SurahsStates{}
class SurhasErrorState extends SurahsStates{}