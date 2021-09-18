import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:plant_care/app/modules/main/submodules/education/ebook/models/ebook_model.dart';
import 'package:plant_care/app/modules/main/submodules/education/ebook/models/rating.dart';
import 'package:plant_care/app/modules/main/submodules/education/ebook/page/ebook_view_store.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:universal_io/io.dart' as IO;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/foundation.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'widgets/rating_widget.dart';

class EbookViewPage extends StatefulWidget {
  const EbookViewPage({Key? key}) : super(key: key);

  @override
  _EbookViewPageState createState() => _EbookViewPageState();
}

class _EbookViewPageState extends ModularState<EbookViewPage, EbookViewStore> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text('Ebook'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        floatingActionButton: Observer(builder: (_) {
          if (controller.isLoading) return Container();
          Ebook ebook = controller.ebook!;

          return FloatingActionButton(
            child: Icon(Icons.book_outlined),
            onPressed: () async {
              await canLaunch(ebook.file!)
                  ? await launch(ebook.file!)
                  : throw 'Could not launch';

              // if ((IO.Platform.isAndroid || IO.Platform.isIOS) && !kIsWeb) {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (c) => Scaffold(
              //         appBar: AppBar(
              //             // backgroundColor: color_colorPrimary,
              //             ),
              //         body: PDF(
              //           autoSpacing: true,
              //           pageFling: true,
              //           pageSnap: true,
              //         ).cachedFromUrl(
              //           ebook.file!,
              //         ),
              //       ),
              //     ),
              //   );
              // } else {

              // }
            },
          );
        }),
        // backgroundColor: color_app_background,
        body: RelativeBuilder(builder: (context, height, width, sy, sx) {
          return SingleChildScrollView(
            // physics: BouncingrScrollPhysics(),
            child: Center(
              child: Container(
                width: width > 500 ? sx(350) : width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Observer(builder: (_) {
                          if (controller.isLoading) return Container();

                          Ebook ebook = controller.ebook!;
                          return Container(
                            padding: EdgeInsets.all(62),
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
                          );
                        }),
                      ),
                      Observer(builder: (_) {
                        if (controller.isLoading)
                          return Container(
                            height: height,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );

                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Divider(),
                              Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: text(
                                  controller.ebook!.name.toString(),
                                  maxLine: 10,
                                  fontSize: 18,
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: 7, left: 20, right: 20),
                                  child: Observer(builder: (_) {
                                    return RatingBar(
                                        itemSize: 25,
                                        ignoreGestures: true,
                                        initialRating: controller.ebook!.rating!.length == 0 ? 0 : controller.getTotalRating,
                                        direction: Axis.horizontal,
                                        allowHalfRating: false,
                                        itemCount: 5,
                                        ratingWidget: RatingWidget(
                                            full: Icon(Icons.star,
                                                color: Colors.orange),
                                            half: Icon(
                                              Icons.star_half,
                                              color: Colors.orange,
                                            ),
                                            empty: Icon(
                                              Icons.star_outline,
                                              color: Colors.orange,
                                            )),
                                        onRatingUpdate: (value) {});
                                  })),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 7, left: 20, right: 20),
                                child: text(controller.ebook!.author.toString(),
                                    maxLine: 5, fontSize: 14.0),
                              ),
                              Divider(),
                              DefaultTabController(
                                length: 2,
                                initialIndex: 0,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      child: TabBar(
                                        indicatorPadding: EdgeInsets.only(
                                            left: 16, right: 16),
                                        indicatorWeight: 2.0,
                                        isScrollable: false,
                                        indicatorSize: TabBarIndicatorSize.tab,
                                        labelStyle: TextStyle(
                                          fontFamily: fontMedium,
                                          fontSize: textSizeSMedium,
                                        ),
                                        indicatorColor: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        unselectedLabelColor: Theme.of(context)
                                            .secondaryHeaderColor,
                                        labelColor: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        labelPadding: EdgeInsets.only(
                                            left: spacing_large,
                                            right: spacing_large),
                                        tabs: [
                                          Tab(child: text("Sinopse")),
                                          Tab(
                                            child: text("Avaliações"),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height,
                                      child: TabBarView(
                                        children: [
                                          Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 7,
                                                    left: 20,
                                                    right: 20),
                                                child: text(
                                                    controller
                                                        .ebook!.description
                                                        .toString(),
                                                    maxLine: 120,
                                                    fontSize: 14.0),
                                              )
                                            ],
                                          ),
                                          Observer(builder: (_) {
                                            return RateWidget();
                                          })
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]);
                      }),
                    ]),
              ),
            ),
          );
        }));
  }
}
