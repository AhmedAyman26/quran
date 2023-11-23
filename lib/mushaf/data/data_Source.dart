import 'package:dio/dio.dart';
import 'package:quran/mushaf/data/mapper/api_surah_model_mapper.dart';
import 'package:quran/mushaf/data/models/api_mushaf_model.dart';
import 'package:quran/mushaf/domain/models/ayah_model.dart';
import 'package:quran/mushaf/domain/models/surah_model.dart';
import 'package:quran/mushaf/domain/repository/mushaf_repository.dart';


class MushafRepositoryImpl extends MushafRepository
{
  final Dio dio=Dio();

  @override
  Future<List<SurahModel>> getSurahs()async {
    final request=await dio.get('http://api.alquran.cloud/v1/quran/quran-uthmani');
    if(request.data!=null)
    {
      final result=ApIMushafModel.fromJson(request.data);
      if(result.code==200) {
        return result.data?.surahs?.map((e) => e.map()).toList()??[];
      }
      else
      {
        throw Exception();
      }
    }
    throw Exception();
  }

  @override
  Future<AyahModel> getAyahs() {
    // TODO: implement getAyahs
    throw UnimplementedError();
  }
  
  
}