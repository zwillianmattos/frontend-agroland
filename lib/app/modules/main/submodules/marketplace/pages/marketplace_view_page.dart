import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:plant_care/app/modules/account/models/user.dart';
import 'package:plant_care/app/modules/main/submodules/marketplace/models.dart';
import 'dart:convert';

class MarketplaceClassificadoViewPage extends StatefulWidget {
  final Classificado classificado;

  const MarketplaceClassificadoViewPage({Key? key, required this.classificado})
      : super(key: key);

  @override
  _MarketplaceClassificadoViewPageState createState() =>
      _MarketplaceClassificadoViewPageState();
}

class _MarketplaceClassificadoViewPageState
    extends State<MarketplaceClassificadoViewPage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext c, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title:
                  innerBoxIsScrolled ? Text(widget.classificado.title) : null,
              pinned: true,
              backgroundColor: color_colorPrimary,
              expandedHeight: 350.0,
              flexibleSpace: FlexibleSpaceBar(
                  background: BannerCarousel.fullScreen(
                      onTap: (pageKey) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Scaffold(
                              backgroundColor: Colors.black,
                              appBar: AppBar(
                                title: Text(widget.classificado.title),
                              ),
                              body: BannerCarousel.fullScreen(
                                // initialPage: pageId,
                                height: MediaQuery.of(context).size.height,
                                viewportFraction: 1,
                                activeColor: Colors.green,
                                disableColor: Colors.white,
                                banners: widget.classificado.classificadoFotos!
                                    .map(
                                      (e) => BannerModel(
                                          id: e.hashCode.toString(),
                                          imagePath: e.imgPath,
                                          boxFit: BoxFit.contain),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        );
                      },
                      height: 450,
                      viewportFraction: 2,
                      activeColor: Colors.green,
                      disableColor: Colors.white,
                      banners: widget.classificado.classificadoFotos!
                          .map((e) => BannerModel(
                              id: e.hashCode.toString(),
                              imagePath: e.imgPath,
                              boxFit: BoxFit.contain))
                          .toList())),
            ),
          ];
        },
        body: ListView(
          padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 8.0),
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text(widget.classificado.title,
                        fontSize: textSizeLarge, maxLine: 10, bold: true),
                    text("R\$ ${widget.classificado.price.toString()}",
                        fontSize: textSizeLarge),
                  ]),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.all(Radius.circular(10)),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.grey.withOpacity(0.25),
            //           spreadRadius: 2,
            //           blurRadius: 19,
            //           offset: Offset(4, 6), // changes position of shadow
            //         ),
            //       ],
            //     ),
            //     padding: const EdgeInsets.only(
            //       top: 16.0,
            //       bottom: 16.0,
            //       right: 16.0,
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       crossAxisAlignment: CrossAxisAlignment.end,
            //       children: [
            //         Expanded(
            //           child: Container(
            //             margin: EdgeInsets.only(
            //                 left: 24.0, right: 24.0, top: 5.0, bottom: 5),
            //             decoration: boxDecoration(
            //                 bgColor: color_edit_background,
            //                 color: color_edit_background,
            //                 showShadow: false,
            //                 radius: 4),
            //             child: appEditTextStyle(
            //                 "Ola ${widget.classificado.logista.user.name}, Esse item ainda esta disponivel ?",
            //                 isPassword: false,
            //                 enableLabel: false,
            //                 enableBorder: false,
            //                 maxLines: 2),
            //           ),
            //         ),
            //         FlatButton(
            //           onPressed: () {},
            //           child: Text("Enviar"),
            //           color: color_colorPrimary,
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: FlatButton(
                        onPressed: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Icon(
                                FontAwesome.whatsapp,
                                color: color_white,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: text("Whatsapp",
                                  textColor: color_white,
                                  fontSize: textSizeSMedium),
                            ),
                          ],
                        ),
                        color: color_colorPrimary,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: FlatButton(
                        onPressed: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Icon(
                                FontAwesome.phone,
                                color: color_white,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: text("Ligar",
                                  textColor: color_white,
                                  fontSize: textSizeSMedium),
                            ),
                          ],
                        ),
                        color: color_color_twitter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: text("Informacoes do vendedor",
                          fontSize: textSizeNormal),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (widget.classificado.logista.imgLogo != null)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(
                                    widget.classificado.logista.imgLogo!,
                                    width: 60,
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      text(
                                          "${widget.classificado.logista.marketName}",
                                          fontSize: textSizeNormal),
                                      text(
                                          "${widget.classificado.logista.phone}",
                                          fontSize: textSizeSmall),
                                      text(
                                          "${widget.classificado.logista.user.name}",
                                          fontSize: textSizeSmall),
                                    ]),
                              ),
                            ]),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              FlatButton(
                                  onPressed: () {
                                    Modular.to.pushNamed('/marketplace/account',
                                        arguments: widget.classificado.logista,
                                        forRoot: true);
                                  },
                                  child: Text("Ver loja"))
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(
                        "https://external.fbau4-1.fna.fbcdn.net/static_map.php?v=2015&osm_provider=2&ccb=4-4&size=328x120&language=pt_BR&scale=1&zoom=11&center=-22.321472167969%2C-49.037475585938&circle=weight%3A2%7Ccolor%3A0x4D6AA47f%7Cfillcolor%3A0x4D6AA41c%7C-22.321472167969%2C-49.037475585938%7C2k",
                      ),
                      fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      spreadRadius: 2,
                      blurRadius: 19,
                      offset: Offset(4, 6), // changes position of shadow
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16.0),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text("Descricao", fontSize: textSizeNormal),
                  Html(
                    data: widget.classificado.description,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
