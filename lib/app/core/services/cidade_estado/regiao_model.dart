class RegiaoModel {
  RegiaoModel({
    required this.id,
    required this.sigla,
    required this.nome,
  });
  late final int id;
  late final String sigla;
  late final String nome;
  
  RegiaoModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    sigla = json['sigla'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['sigla'] = sigla;
    _data['nome'] = nome;
    return _data;
  }
}