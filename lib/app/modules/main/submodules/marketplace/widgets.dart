import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:plant_care/app/modules/main/submodules/marketplace/models.dart';
import 'package:plant_care/app/modules/main/submodules/marketplace/models/product_sell.dart';
import 'package:relative_scale/relative_scale.dart';

class CategoriaWidget extends StatefulWidget {
  final String description;

  const CategoriaWidget({Key? key, required this.description})
      : super(key: key);

  @override
  _CategoriaWidgetState createState() => _CategoriaWidgetState();
}

class _CategoriaWidgetState extends State<CategoriaWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: Text(widget.description),
        onPressed: () {},
      ),
    );
  }
}

class BuscaWidget extends StatelessWidget {
  const BuscaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 16, top: 16),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3100)),
          color: white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 2,
              blurRadius: 19,
              offset: Offset(4, 6), // changes position of shadow
            ),
          ],
        ),
        child: TextField(
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              fillColor: color_white,
              hintText: "Buscar",
              border: InputBorder.none,
              prefixIcon: Icon(Typicons.search_outline),
              contentPadding: EdgeInsets.only(
                  left: 26.0, bottom: 8.0, top: 8.0, right: 50.0),
            )),
        alignment: Alignment.center,
      ),
    );
  }
}

class CardAnuncio extends StatelessWidget {
  final ProductSell classificado;

  const CardAnuncio({
    Key? key,
    required this.classificado,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return SizedBox(
        child: InkWell(
          onTap: () {
            Modular.to.pushNamed('/marketplace/view',
                arguments: classificado, forRoot: true);
          },
          child: Container(
            padding: EdgeInsets.all(6.0),
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.only(
                            left: spacing_control, right: spacing_control),
                        decoration: boxDecoration(
                            radius: spacing_control, bgColor: color_light_gray),
                        child: text(
                            classificado
                                .productSellCategories!.first.description!,
                            fontSize: textSizeSmall,
                            isCentered: true,
                            isLongText: true),
                      ),
                    ),
                    Expanded(child: Container()),
                    Expanded(
                        child: Icon(Icons.favorite_border,
                            color: color_icon_color))
                  ],
                ),
                SizedBox(height: 4),
                Align(
                  alignment: Alignment.center,
                  child: CachedNetworkImage(
                    placeholder: (context, url) => Image.asset(
                        'images/LikeButton/image/grey.jpg',
                        fit: BoxFit.cover),
                    imageUrl: classificado.productSellPhotos!.first.imgPath!,
                    fit: BoxFit.contain,
                    height: sy(height) * 0.10,
                    width: sx(width) * 0.25,
                  ),
                ),
                SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.only(left: 4, right: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      text("R\$ ${classificado.price}",
                          fontSize: textSizeSmall,
                          textColor: color_textColorSecondary,
                          maxLine: 2),
                      text(classificado.title!, maxLine: 1, fontSize: 12.0),
                    ],
                  ),
                ),
                SizedBox(height: 4),
              ],
            ),
          ),
        ),
      );
    });
  }
}
