import 'package:equatable/equatable.dart';

class ReaderModel extends Equatable
{
  final String? name;
  final String? enName;
  final String? identifier;

  const ReaderModel({this.name, this.enName, this.identifier});

  @override
  List<Object?> get props => [name,enName,identifier];
}