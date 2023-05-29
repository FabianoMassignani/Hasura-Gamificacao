class ProjetoEntity {
  final int? projetoID;
  final String nome;
  final String descricao;
  final String dataInicio;
  final String dataTermino;

  ProjetoEntity(
      {this.projetoID,
      required this.nome,
      required this.descricao,
      required this.dataInicio,
      required this.dataTermino});
}
