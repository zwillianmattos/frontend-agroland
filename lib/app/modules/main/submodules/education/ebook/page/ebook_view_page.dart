import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/modules/main/submodules/education/ebook/models/ebook_model.dart';

class EbookViewPage extends StatelessWidget {
  final Ebook ebook;

  const EbookViewPage({Key? key, required this.ebook}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(ebook.name!),
          backgroundColor: color_colorPrimary,
        ),
        body: Container(
          child: PDF().cachedFromUrl(ebook.file!),
        ));
  }
}
