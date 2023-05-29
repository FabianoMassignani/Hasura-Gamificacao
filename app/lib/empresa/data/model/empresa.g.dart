// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empresa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmpresaModel _$EmpresaModelFromJson(Map<String, dynamic> json) => EmpresaModel(
      empresaID: json['empresaID'] as int?,
      nome: json['nome'] as String,
      endereco: json['endereco'] as String,
      telefone: json['telefone'] as String,
    );

Map<String, dynamic> _$EmpresaModelToJson(EmpresaModel instance) =>
    <String, dynamic>{
      'empresaID': instance.empresaID,
      'nome': instance.nome,
      'endereco': instance.endereco,
      'telefone': instance.telefone,
    };
