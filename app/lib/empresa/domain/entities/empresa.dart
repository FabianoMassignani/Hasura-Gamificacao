class EmpresaEntity {
  final int? empresaID;
  final String nome;
  final String endereco;
  final String telefone;

  const EmpresaEntity({
    this.empresaID,
    required this.nome,
    required this.endereco,
    required this.telefone,
  });

  String get nomeCompleto => '$nome ';
}
