import 'package:banner_carousel/banner_carousel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/core/env/variables.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:universal_io/io.dart' as IO;
import 'package:plant_care/app/modules/main/submodules/marketplace/models/product_sell.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:core';
import 'package:plant_care/app/core/env/variables.dart';

class MarketplaceClassificadoViewPage extends StatefulWidget {
  final ProductSell classificado;

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
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: color_app_background,
        centerTitle: true,
        title: text("Marketplace",
            fontSize: 20.0, textColor: color_textColorPrimary),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.favorite_border, color: color_icon_color),
              onPressed: () {})
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 8.0),
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              BannerCarousel.fullScreen(
                onTap: (pageKey) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        backgroundColor: Colors.black,
                        appBar: AppBar(
                          title: Text(widget.classificado.title!),
                        ),
                        body: BannerCarousel.fullScreen(
                          // initialPage: pageId,
                          height: MediaQuery.of(context).size.height,
                          viewportFraction: 1,
                          activeColor: Colors.green,
                          disableColor: Colors.white,
                          banners: widget.classificado.productSellPhotos!
                              .map(
                                (e) => BannerModel(
                                    id: e.hashCode.toString(),
                                    imagePath: e.imgPath!,
                                    boxFit: BoxFit.contain),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  );
                },
                height: 350,
                viewportFraction: 2,
                activeColor: Colors.green,
                disableColor: Colors.white,
                banners: widget.classificado.productSellPhotos!
                    .map(
                      (e) => BannerModel(
                          id: e.hashCode.toString(),
                          imagePath: e.imgPath!,
                          boxFit: BoxFit.contain),
                    )
                    .toList(),
              ),
              text(widget.classificado.title!,
                  fontSize: textSizeLarge, maxLine: 10, bold: true),
              text("R\$ ${widget.classificado.price.toString()}",
                  fontSize: textSizeLarge),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: color_colorPrimary,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      onPressed: () async {
                        var phoneNumber = widget
                            .classificado.producerUser?.phone
                            ?.replaceAll('(', '')
                            .replaceAll(')', '')
                            .replaceAll('-', '')
                            .replaceAll(' ', '');
                        print(Uri.parse(
                                "https://api.whatsapp.com/send?phone=55$phoneNumber&text=Olá estou interesado no produto ${widget.classificado.title} - ${widget.classificado.price}, $WEBSITEDOMAIN#/${Modular.to.path}")
                            .toString());
                        await launch(Uri.parse(
                                "https://api.whatsapp.com/send?phone=55$phoneNumber&text=Olá estou interesado no produto ${widget.classificado.title} - ${widget.classificado.price}, $WEBSITEDOMAIN#/${Modular.to.path}")
                            .toString());
                      },
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
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: color_color_twitter,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      onPressed: () async {
                        var phoneNumber = widget
                            .classificado.producerUser?.phone
                            ?.replaceAll('(', '')
                            .replaceAll(')', '')
                            .replaceAll('-', '')
                            .replaceAll(' ', '');
                        await launch("tel:+55$phoneNumber");
                      },
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (widget.classificado.producerUser?.imgLogo !=
                                null)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipOval(
                                  child: Image.network(
                                    widget.classificado.producerUser!.imgLogo!,
                                    width: 42,
                                  ),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    text(
                                        "${widget.classificado.producerUser!.fantasyName}",
                                        isLongText: true,
                                        maxLine: 2,
                                        fontSize: textSizeSmall),
                                    text(
                                        "${widget.classificado.producerUser!.cnpj}",
                                        fontSize: textSizeSmall,
                                        isLongText: true,
                                        maxLine: 5),
                                  ]),
                            ),
                          ]),
                      Column(
                        children: [
                          FlatButton(
                              onPressed: () {
                                Modular.to.pushNamed('/marketplace/account',
                                    arguments: widget.classificado.producerUser,
                                    forRoot: (IO.Platform.isAndroid ||
                                            IO.Platform.isIOS)
                                        ? true
                                        : false);
                              },
                              child: Text("Ver loja"))
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Html(
                  data: widget.classificado.description,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
