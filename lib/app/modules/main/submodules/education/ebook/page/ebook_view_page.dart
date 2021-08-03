import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:plant_care/app/modules/main/submodules/education/ebook/models/ebook_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' as IO;

class EbookViewPage extends StatefulWidget {
  final Ebook ebook;

  const EbookViewPage({Key? key, required this.ebook}) : super(key: key);

  @override
  _EbookViewPageState createState() => _EbookViewPageState();
}

class _EbookViewPageState extends State<EbookViewPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
        height: 50,
        color: Colors.transparent,
        child: appButton(
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
                    body: PDF().cachedFromUrl(widget.ebook.file!,),
                  ),
                ),
              );
            } else {
              await canLaunch(widget.ebook.file!)
                  ? await launch(widget.ebook.file!)
                  : throw 'Could not launch';
            }
          },
        ),
      ),
      backgroundColor: color_app_background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: BackButton(),
              // elevation: 0,
              // title: Image.asset(
              //   'images/logo.png',
              //   scale: 2.5,
              // ),

              centerTitle: true,
              expandedHeight: MediaQuery.of(context).size.height * 0.5,
              actions: [
                IconButton(
                    icon: SvgPicture.asset(
                      "images/notification_broken.svg",
                      color: color_white,
                    ),
                    onPressed: () {})
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
                              widget.ebook.file
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
                    child: text(widget.ebook.name.toString(), maxLine: 5),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 7, left: 20, right: 20),
                    child: text(widget.ebook.author.toString(),
                        maxLine: 5, fontSize: 14.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 7, left: 20, right: 20),
                    child: text(widget.ebook.description.toString(),
                        maxLine: 120, fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
