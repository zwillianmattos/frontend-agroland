import 'package:image/image.dart';

abstract class IRecognition {
  Future<void> loadModel();
  Future<void> loadLabels();
  dynamic predict(Image image);
}
