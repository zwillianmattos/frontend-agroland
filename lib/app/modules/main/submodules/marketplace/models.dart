import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:plant_care/app/modules/account/models/user.dart';

class MenuCategoriaClassificados {
  ClassificadoCategoria categoria;
  List<Classificado> classificados;

  MenuCategoriaClassificados(
      {required this.categoria, required this.classificados});
}

class Logista {
  String cnpj;
  String marketName;
  String description;
  User user;
  Position? location;
  String? phone;
  String? email;
  String? imgLogo;
  Logista(
      {required this.cnpj,
      required this.marketName,
      required this.description,
      required this.user,
      this.location,
      this.phone,
      this.email,
      this.imgLogo});
}

class ClassificadoFotos {
  String imgPath;
  String? description;
  ClassificadoFotos({required this.imgPath, this.description});
}

class ClassificadoCategoria {
  String description;

  ClassificadoCategoria({required this.description});
}

class Classificado {
  Logista logista;
  String title;
  String description;
  double price;
  LocationData? location;
  List<ClassificadoFotos>? classificadoFotos;
  ClassificadoCategoria category;
  Classificado(
      {required this.title,
      required this.description,
      required this.price,
      this.location,
      required this.logista,
      this.classificadoFotos,
      required this.category});
}
