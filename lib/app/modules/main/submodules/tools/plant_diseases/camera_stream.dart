import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CameraStream extends StatefulWidget {
  CameraStream({Key? key}) : super(key: key);

  @override
  _CameraStreamState createState() => _CameraStreamState();
}

class _CameraStreamState extends State<CameraStream> {
  List<CameraDescription>? cameras;
  CameraController? controller;

  bool _isCameraInitialized = false;
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    initCamera();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  initCamera() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      cameras = await availableCameras();

      if (cameras != null) {
        controller = CameraController(
          cameras!.first,
          ResolutionPreset.ultraHigh,
          imageFormatGroup: ImageFormatGroup.jpeg,
        );
        controller?.initialize().then((_) {
          if (!mounted) {
            return;
          }
          setState(() {
            _isCameraInitialized = controller!.value.isInitialized;
          });
        });
      }
    } on CameraException catch (e) {
      print('Error in fetching the cameras: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isCameraInitialized
          ? AspectRatio(
              aspectRatio: 1 / controller!.value.aspectRatio,
              child: controller!.buildPreview(),
            )
          : Container(),
    );
  }
}
