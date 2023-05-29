import 'package:aula5/empresa/domain/entities/empresa.dart';
import 'package:json_annotation/json_annotation.dart';

part 'empresa.g.dart';

@JsonSerializable()
class EmpresaModel extends EmpresaEntity {
  const EmpresaModel({
    super.empresaID,
    required super.nome,
    required super.endereco,
    required super.telefone,
  });

  factory EmpresaModel.fromJson(Map<String, dynamic> json) =>
      _$EmpresaModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmpresaModelToJson(this);
}
