import 'package:equatable/equatable.dart';
import 'package:quran/mushaf/domain/models/ayah_model.dart';

class SurahModel extends Equatable
{
  final String? name;
  final int? number;
  final List<AyahModel>? ayahs;

  const SurahModel({this.name, this.number, this.ayahs});

  @override
  List<Object?> get props => [name,number,ayahs];
}