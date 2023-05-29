class FuncionarioEntity {
  final int? funcionarioID;
  final String nome;
  final String sobrenome;
  final String endereco;
  final String telefone;

  const FuncionarioEntity({
    this.funcionarioID,
    required this.nome,
    required this.sobrenome,
    required this.endereco,
    required this.telefone,
  });

  String get nomeCompleto => '$nome $sobrenome';
}
