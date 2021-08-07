import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:plant_care/app/modules/main/submodules/education/ebook/models/ebook_model.dart';
import 'package:plant_care/app/modules/main/submodules/education/ebook/page/ebook_view_store.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:universal_io/io.dart' as IO;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/foundation.dart';

class EbookViewPage extends StatefulWidget {
  const EbookViewPage({Key? key}) : super(key: key);

  @override
  _EbookViewPageState createState() => _EbookViewPageState();
}

class _EbookViewPageState extends ModularState<EbookViewPage, EbookViewStore> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
        height: 50,
        color: Colors.transparent,
        child: Observer(builder: (_) {
          if (controller.isLoading) return Container();

          Ebook ebook = controller.ebook!;

          return appButton(
            textContent: "Abrir ebook",
            onPressed: () async {
              if (IO.Platform.isAndroid || IO.Platform.isIOS) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) => Scaffold(
                      appBar: AppBar(
                        backgroundColor: color_colorPrimary,
                      ),
                      body: PDF(
                        autoSpacing: true,
                        pageFling: true,
                        pageSnap: true,
                      ).cachedFromUrl(
                        ebook.file!,
                      ),
                    ),
                  ),
                );
              } else {
                await canLaunch(ebook.file!)
                    ? await launch(ebook.file!)
                    : throw 'Could not launch';
              }
            },
          );
        }),
      ),
      backgroundColor: color_app_background,
      body: Observer(builder: (_) {
        if (controller.isLoading) return Container();

        Ebook ebook = controller.ebook!;

        return SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: BackButton(),
                centerTitle: true,
                expandedHeight: MediaQuery.of(context).size.height * 0.5,
                actions: [
                  IconButton(
                      icon: Icon(Icons.favorite_outline), onPressed: () {})
                ],
                flexibleSpace: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  color: color_colorPrimary,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 62),
                          width: 120,
                          height: 172,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                ebook.file
                                    .toString()
                                    .replaceFirst('.pdf', '.jpg'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: EdgeInsets.only(top: 24, left: 20, right: 20),
                      child: text(ebook.name.toString(), maxLine: 5),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7, left: 20, right: 20),
                      child: text(ebook.author.toString(),
                          maxLine: 5, fontSize: 14.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7, left: 20, right: 20),
                      child: text(ebook.description.toString(),
                          maxLine: 120, fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
