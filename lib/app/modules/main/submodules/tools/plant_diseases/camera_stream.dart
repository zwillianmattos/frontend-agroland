import 'package:agro_tools/app/core/consts/colors.dart';
import 'package:agro_tools/app/core/consts/texts.dart';
import 'package:agro_tools/app/core/utils/user_preferences_store.dart';
import 'package:agro_tools/app/core/widgets/widgets.dart';
import 'package:agro_tools/app/modules/main/submodules/tools/home_view.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

class CameraStream extends StatefulWidget {
  CameraStream({Key? key}) : super(key: key);

  @override
  _CameraStreamState createState() => _CameraStreamState();
}

class _CameraStreamState extends State<CameraStream> {
  List<CameraDescription>? cameras;
  CameraController? controller;
  double zoom = 0;
  bool cameraSwitch = false;
  bool _isCameraInitialized = false;
  final picker = ImagePicker();
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(statusBarIconBrightness: Brightness.dark));
    initCamera();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  initCamera({
    int cameraSize = 0,
  }) async {
    try {
      _isCameraInitialized = false;

      WidgetsFlutterBinding.ensureInitialized();
      cameras = await availableCameras();

      if (cameras != null) {
        controller = CameraController(
          cameras![cameraSize],
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
    final size = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        brightness: Brightness.dark,
        title: text("Identificar Doença"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  cameraSwitch = !cameraSwitch;
                  initCamera(cameraSize: cameraSwitch ? 1 : 0);
                });
              },
              icon: Icon(cameraSwitch
                  ? Icons.cameraswitch_outlined
                  : Icons.cameraswitch_sharp))
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: _isCameraInitialized
          ? Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: AspectRatio(
                    aspectRatio: 3 / 4,
                    child: OverflowBox(
                        alignment: Alignment.center,
                        child: controller!.buildPreview()),
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: sizeHeight * 0.35,
                  child: Container(
                    height: 250,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Slider(
                        label: "Zoom: $zoom",
                        activeColor: color_colorPrimary,
                        onChanged: (double val) {
                          setState(() {
                            zoom = val;
                            val = val * 10;
                            if (val <= 8.0 && val >= 1.0) {
                              controller!.setZoomLevel(val);
                            }
                          });
                        },
                        value: zoom,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Container(
              child: Center(child: CircularProgressIndicator()),
            ),
      floatingActionButton: Container(
        height: sizeHeight * 0.2,
        color: Theme.of(context).backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: IconButton(
                    onPressed: () async {
                      final pickedFile =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeView(
                                        imageParam: pickedFile,
                                      )));
                        });
                      }
                    },
                    icon: Icon(
                      Icons.image,
                      color: color_colorPrimary,
                    ),
                  ),
                ),
                Container(
                  child: FloatingActionButton(
                    onPressed: () async {
                      XFile img = await controller!.takePicture();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeView(
                                    imageParam: img,
                                  )));
                    },
                    tooltip: 'Tirar Foto',
                    child: Icon(Icons.camera_alt),
                  ),
                ),
                Container(
                  child: IconButton(
                    onPressed: () {
                      _showHelpModal();
                    },
                    icon: Icon(
                      Icons.help,
                      color: color_colorPrimary,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future _showHelpModal() async {
    return await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext bc) {
          return Container(
            child: ListView(children: [
              SizedBox(height: 40),
              headingWidViewAll(context, "Dicas para fotografia: ", () {
                Navigator.pop(context);
              }, itemSubText: "Voltar"),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    text(
                      "1. Centralize a planta no quadro, evite imagens escuras ou embaçadas.",
                      maxLine: 5,
                      fontSize: 12,
                    ),
                    Image.asset("images/dicas/1.png"),
                    text(
                      "2. Se a planta for grande demais,  inclua apenas as folhas ou a flor.",
                      maxLine: 5,
                      fontSize: 12,
                    ),
                    Image.asset("images/dicas/2.png"),
                    text(
                      "3. Evite se aproximar demais, apenas garanta que a folha ou a flor está completa e visível.",
                      maxLine: 5,
                      fontSize: 12,
                    ),
                    Image.asset("images/dicas/3.png"),
                    text(
                      "4. Foque na flor caso susa planta tenha flores.",
                      maxLine: 5,
                      fontSize: 12,
                    ),
                    Image.asset("images/dicas/4.png"),
                    text(
                      "5. Inclua apenas uma espécie por vez.",
                      maxLine: 5,
                      fontSize: 12,
                    ),
                    Image.asset("images/dicas/5.png"),
                  ],
                ),
              ),
              SizedBox(height: 25),
            ]),
          );
        });
  }
}
