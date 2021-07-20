import 'package:banner_carousel/banner_carousel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:plant_care/app/modules/account/models/user.dart';
import 'package:plant_care/app/modules/main/submodules/marketplace/models.dart';
import 'dart:convert';

import 'package:plant_care/app/modules/main/submodules/marketplace/models/product_sell.dart';

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
        backgroundColor: color_app_background,
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
          //                 "Ola ${widget.classificado.producerUser.corporateName}, Esse item ainda esta disponivel ?",
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
                            if (widget.classificado.producerUser.imgLogo !=
                                null)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  widget.classificado.producerUser.imgLogo!,
                                  width: 60,
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
                                        "${widget.classificado.producerUser.corporateName}",
                                        fontSize: textSizeNormal),
                                    text(
                                      "${widget.classificado.producerUser.phone}",
                                      fontSize: textSizeSmall,
                                      isLongText: true,
                                    ),
                                    text(
                                        "${widget.classificado.producerUser.cnpj}",
                                        fontSize: textSizeSmall,
                                        isLongText: true,
                                        maxLine: 5),
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
                                      arguments: widget.classificado.producerUser,
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
          Container(
            padding: const EdgeInsets.all(16.0),
            height: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      spreadRadius: 2,
                      blurRadius: 19,
                      offset: Offset(4, 6), // changes position of shadow
                    ),
                  ],
                ),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl:
                      "https://www.google.com/maps/api/staticmap?key=AIzaSyALrSTy6NpqdhIOUs3IQMfvjh71td2suzY&center=${widget.classificado.producerUser.location}8&zoom=12&size=600x300&markers=color:red%7Clabel:${widget.classificado.producerUser.corporateName}%7C${widget.classificado.producerUser.location}",
                ),
              ),
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
    );
  }
}
