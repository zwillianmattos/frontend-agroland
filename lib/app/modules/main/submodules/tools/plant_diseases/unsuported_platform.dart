import 'recognition_interface.dart';

abstract class Classifier implements IRecognition {
  Classifier() {
    throw UnimplementedError("Plataforma não suportada");
  }
}
