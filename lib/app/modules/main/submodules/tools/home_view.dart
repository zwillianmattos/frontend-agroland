import 'dart:io';
import 'dart:typed_data';
import 'package:agro_tools/app/core/widgets/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:image/image.dart' as img;

import './plant_diseases/classifier.dart'
    if (dart.library.io) './plant_diseases/classifier.dart'
    if (dart.library.js) './plant_disease/unsuported_platform.dart'
    if (dart.library.html) './plant_disease/unsuported_platform.dart';

import './plant_diseases/classifier_quant.dart';

/// [HomeView] stacks [CameraView] and [BoxWidget]s with bottom sheet for stats
class HomeView extends StatefulWidget {
  final XFile imageParam;
  const HomeView({Key? key, required this.imageParam}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Classifier _classifier;

  File? _image;
  final picker = ImagePicker();

  Image? _imageWidget;

  img.Image? fox;

  dynamic category;

  @override
  void initState() {
    super.initState();
    _classifier = ClassifierQuant(numThreads: 4);

    getImage();
  }

  Future getImage() async {
    var directory = await getTemporaryDirectory();
    await widget.imageParam.saveTo(directory.path + 'test.jpg');

    setState(() {
      _image = File(directory.path + 'test.jpg');
      _imageWidget = Image.file(_image!);
      _predict();
    });
  }

  void _predict() async {
    img.Image imageInput = img.decodeImage(_image!.readAsBytesSync())!;
    var pred = _classifier.predict(imageInput);
    setState(() {
      this.category = pred;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                pinned: false,
                title: innerBoxIsScrolled
                    ? text(
                        'Resultado',
                        isCentered: true,
                      )
                    : null,
                backgroundColor: Theme.of(context).colorScheme.background,
                expandedHeight: 250.0,
                flexibleSpace: _image == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height / 2),
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: _imageWidget,
                      ),
              ),
            ];
          },
          body: _image == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  // color: color_app_background,
                  child: Column(children: [
                    SizedBox(
                      height: 36,
                    ),
                    Text(
                      category != null ? category!.label : '',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      category != null
                          ? 'Precisão: ${category!.score.toStringAsFixed(3)}'
                          : '',
                      style: TextStyle(fontSize: 16),
                    ),
                  ]),
                )),
    );
  }
}
