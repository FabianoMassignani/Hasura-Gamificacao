import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/projeto.dart';

part 'projeto.g.dart';

@JsonSerializable()
class ProjetoModel extends ProjetoEntity {
  ProjetoModel(
      {super.projetoID,
      required super.nome,
      required super.descricao,
      required super.dataInicio,
      required super.dataTermino});

  factory ProjetoModel.fromJson(Map<String, dynamic> json) =>
      _$ProjetoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjetoModelToJson(this);
}
