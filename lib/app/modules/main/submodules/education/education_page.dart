import 'package:banner_carousel/banner_carousel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:plant_care/app/modules/main/submodules/education/education_store.dart';
import 'package:universal_io/io.dart' as IO;

import 'package:url_launcher/url_launcher.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({Key? key}) : super(key: key);

  @override
  _EducationPageState createState() => _EducationPageState();
}

class _EducationPageState extends ModularState<EducationPage, EducationStore> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: color_app_background,
          centerTitle: true,
          title: text("Educação",
              fontSize: 20.0, textColor: color_textColorPrimary),

          actions: <Widget>[
            IconButton(
                icon: SvgPicture.asset(
                  "images/search_broken.svg",
                ),
                onPressed: () {
                  Modular.to.pushNamed('/education/search', forRoot: true);
                }),
          ],
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 45),
            child: Align(
              alignment: Alignment.topLeft,
              child: TabBar(
                indicatorPadding: EdgeInsets.only(left: 30, right: 30),
                indicatorWeight: 3.0,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: TextStyle(
                  fontFamily: fontMedium,
                  fontSize: textSizeNormal,
                ),
                indicatorColor: color_colorPrimary,
                unselectedLabelColor: color_textColorPrimary,
                labelColor: color_colorPrimary,
                labelPadding:
                    EdgeInsets.only(left: spacing_large, right: spacing_large),
                tabs: [
                  Tab(child: text("Home")),
                  Tab(child: text("Ebooks")),
                  Tab(child: text("Videos")),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 20,
                ),
                Observer(builder: (_) {
                  if (controller.isLoading == true)
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  return Container(
                    child: BannerCarousel(
                      height: 200,
                      activeColor: Colors.green,
                      disableColor: Colors.grey,
                      animation: true,
                      indicatorBottom: true,
                      customizedBanners: [
                        "https://res.cloudinary.com/dxz4ivhm8/image/upload/v1628109980/plant-care/ebooks/vender-no-agro-990x550.png",
                      ]
                          .map(
                            (e) => InkWell(
                              onTap: () {
                                Modular.to.pushNamed(
                                    'ebook/view/${controller.ebookBanners.first.id}',
                                    arguments: controller.ebookBanners.first,
                                    forRoot: true);
                              },
                              child: Container(
                                child: Image.network(e, fit: BoxFit.contain),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  );
                }),
                appLabelViewAll("Ebooks"),
                Observer(builder: (_) {
                  return Container(
                    child: (controller.isLoading == true)
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            height: (width * 0.28) * 8.8 / 6,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.ebooks.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(
                                  left: spacing_standard,
                                  right: spacing_standard_new),
                              itemBuilder: (context, index) {
                                return Container(
                                  margin:
                                      EdgeInsets.only(left: spacing_standard),
                                  width: width * 0.28,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  child: InkWell(
                                    child: AspectRatio(
                                      aspectRatio: 6 / 8.8,
                                      child: Stack(
                                        alignment: Alignment.bottomLeft,
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.15),
                                                  spreadRadius: 0,
                                                  blurRadius: 5,
                                                  offset: Offset(0,
                                                      0), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                              child: CachedNetworkImage(
                                                imageUrl: controller
                                                    .ebooks[index].file
                                                    .toString()
                                                    .replaceFirst(
                                                        '.pdf', '.jpg'),
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () async {
                                      Modular.to.pushNamed(
                                          'ebook/view/${controller.ebooks[index].id}',
                                          arguments: controller.ebooks[index],
                                          forRoot: true);
                                    },
                                    radius: spacing_control,
                                  ),
                                );
                              },
                            ),
                          ),
                  );
                }),
                appLabelViewAll("Videos"),
                Container(
                  height: ((width / 2) - 36) * (2.5 / 4),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.videosList.length,
                    padding: EdgeInsets.only(
                        left: spacing_standard, right: spacing_standard_new),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(left: spacing_standard),
                        width: (width / 2) - 36,
                        child: InkWell(
                          child: Column(
                            children: [
                              AspectRatio(
                                aspectRatio: 4 / 2.5,
                                child: Image.network(
                                    "https://i.ytimg.com/vi/${controller.videosList[index]}/hqdefault.jpg",
                                    width: double.infinity,
                                    height: double.infinity),
                              ),
                            ],
                          ),
                          onTap: () {
                            Modular.to.pushNamed('videos/', arguments: controller.videosList[index], forRoot: true);
                          },
                          radius: spacing_control,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Observer(builder: (_) {
              return ListView(
                physics: BouncingScrollPhysics(),
                controller: controller.ebooksController,
                children: controller.ebooksList
                    .map((element) => ListTile(
                          onTap: () {
                            Modular.to.pushNamed('ebook/view/${element.id}',
                                arguments: element, forRoot: true);
                          },
                          minVerticalPadding: 20,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          leading: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              width: 50,
                              height: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      element.file
                                          .toString()
                                          .replaceFirst('.pdf', '.jpg'),
                                    ),
                                  )),
                            ),
                          ),
                          title: text(element.name.toString(),
                              fontSize: 14.0, maxLine: 10),
                          subtitle: text(element.description.toString(),
                              fontSize: 12.0),
                        ))
                    .toList(),
              );
            }),
            Observer(builder: (_) {
              return ListView(
                physics: BouncingScrollPhysics(),
                controller: controller.ebooksController,
                children: controller.ebooksList
                    .map((element) => ListTile(
                          onTap: () {
                            Modular.to.pushNamed('ebook/view/${element.id}',
                                arguments: element, forRoot: true);
                          },
                          minVerticalPadding: 20,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          leading: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              width: 50,
                              height: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      element.file
                                          .toString()
                                          .replaceFirst('.pdf', '.jpg'),
                                    ),
                                  )),
                            ),
                          ),
                          title: text(element.name.toString(),
                              fontSize: 14.0, maxLine: 10),
                          subtitle: text(element.description.toString(),
                              fontSize: 12.0),
                        ))
                    .toList(),
              );
            }),
          ],
        ),
      ),
    );
  }
}
