import 'package:equatable/equatable.dart';

class AyahModel extends Equatable
{
  final int? number;
  final String? text;
  final bool? sajda;
  final String? audio;

  const AyahModel({this.number, this.text, this.sajda,this.audio});

  @override
  List<Object?> get props => [number,text,sajda,audio];
}