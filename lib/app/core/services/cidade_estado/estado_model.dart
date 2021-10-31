import 'package:agro_tools/app/core/services/cidade_estado/regiao_model.dart';

class EstadoModel {
  EstadoModel({
    required this.id,
    required this.sigla,
    required this.nome,
    required this.regiao,
  });
  late final int id;
  late final String sigla;
  late final String nome;
  late final RegiaoModel regiao;
  
  EstadoModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    sigla = json['sigla'];
    nome = json['nome'];
    regiao = RegiaoModel.fromJson(json['regiao']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['sigla'] = sigla;
    _data['nome'] = nome;
    _data['regiao'] = regiao.toJson();
    return _data;
  }
}

