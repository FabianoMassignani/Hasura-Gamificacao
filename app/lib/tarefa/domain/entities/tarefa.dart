class TarefaEntity {
  final int? tarefaID;
  final String descricao;
  final String dataInicio;
  final String dataTermino;
  final String status;

  const TarefaEntity({
    this.tarefaID,
    required this.descricao,
    required this.dataInicio,
    required this.dataTermino,
    required this.status,
  });
}
