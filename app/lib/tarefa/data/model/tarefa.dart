import 'package:aula5/tarefa/domain/entities/tarefa.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tarefa.g.dart';

@JsonSerializable()
class TarefaModel extends TarefaEntity {
  const TarefaModel({
    super.tarefaID,
    required super.descricao,
    required super.dataInicio,
    required super.dataTermino,
    required super.status,
  });

  factory TarefaModel.fromJson(Map<String, dynamic> json) =>
      _$TarefaModelFromJson(json);

  Map<String, dynamic> toJson() => _$TarefaModelToJson(this);
}
