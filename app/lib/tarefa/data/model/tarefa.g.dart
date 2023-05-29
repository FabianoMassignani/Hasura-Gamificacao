// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tarefa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************
TarefaModel _$TarefaModelFromJson(Map<String, dynamic> json) => TarefaModel(
      tarefaID: json['tarefaID'] as int?,
      descricao: json['descricao'] as String,
      dataInicio: json['dataInicio'] as String,
      dataTermino: json['dataTermino'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$TarefaModelToJson(TarefaModel instance) =>
    <String, dynamic>{
      'tarefaID': instance.tarefaID,
      'descricao': instance.descricao,
      'dataInicio': instance.dataInicio,
      'dataTermino': instance.dataTermino,
      'status': instance.status,
    };
