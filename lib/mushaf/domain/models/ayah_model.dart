import 'package:equatable/equatable.dart';

class AyahModel extends Equatable
{
  final int? number;
  final String? text;
  final bool? sajda;

  const AyahModel({this.number, this.text, this.sajda});

  @override
  List<Object?> get props => throw [number,text,sajda];
}