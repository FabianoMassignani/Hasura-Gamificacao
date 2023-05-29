// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projeto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjetoModel _$ProjetoModelFromJson(Map<String, dynamic> json) => ProjetoModel(
      projetoID: json['projetoID'] as int?,
      nome: json['nome'] as String,
      descricao: json['descricao'] as String,
      dataInicio: json['dataInicio'] as String,
      dataTermino: json['dataTermino'] as String,
    );

Map<String, dynamic> _$ProjetoModelToJson(ProjetoModel instance) =>
    <String, dynamic>{
      'projetoID': instance.projetoID,
      'nome': instance.nome,
      'descricao': instance.descricao,
      'dataInicio': instance.dataInicio,
      'dataTermino': instance.dataTermino,
    };
