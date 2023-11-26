import 'package:equatable/equatable.dart';
import 'package:quran/mushaf/domain/models/ayah_model.dart';

class SurahModel extends Equatable
{
  final String? name;
  final int? number;
  final List<AyahModel>? ayahs;
  final String? revelationType;

  const SurahModel( {this.name, this.number, this.ayahs,this.revelationType,});

  @override
  List<Object?> get props => [name,number,ayahs,revelationType,];
}