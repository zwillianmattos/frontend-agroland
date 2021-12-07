class CidadeModel {
  CidadeModel({
    required this.id,
    required this.nome,
    required this.estado,
  });
  late final dynamic id;
  late final String nome;
  late final CidadeModel estado;

  CidadeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nome'] = nome;
    return _data;
  }
}
