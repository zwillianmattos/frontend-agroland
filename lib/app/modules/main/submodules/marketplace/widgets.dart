import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/modules/main/submodules/marketplace/models.dart';
import 'package:plant_care/app/widgets/widgets.dart';
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
  final Classificado classificado;

  const CardAnuncio({
    Key? key,
    required this.classificado,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3)),
          boxShadow: [
            // BoxShadow(
            //   color: Colors.grey.withOpacity(0.15),
            //   spreadRadius: 2,
            //   blurRadius: 19,
            //   offset: Offset(4, 6), // changes position of shadow
            // ),
          ],
        ),
        child: InkWell(
          onTap: () {
            Modular.to.pushNamed('/marketplace/view',
                arguments: classificado, forRoot: true);
          },
          child: Card(
            color: color_white,
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: sy(80),
                  width: width,
                  child: FadeInImage(
                    image: NetworkImage(
                        classificado.classificadoFotos![0].imgPath),
                    fit: BoxFit.contain,
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.network(
                          "https://i.pinimg.com/originals/13/9a/19/139a190b930b8efdecfdd5445cae7754.png");
                    },
                    placeholder: NetworkImage(
                        "https://ak.picdn.net/shutterstock/videos/1039407446/thumb/1.jpg"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      text("R\$ ${classificado.price}",
                          fontSize: textSizeSmall, fontFamily: fontBold),
                      text(classificado.title,
                          fontSize: textSizeSmall, maxLine: 2),
                      if (classificado.location != null)
                        text(
                          classificado.location.toString(),
                          fontSize: textSizeSmall,
                          textColor: Colors.grey,
                        ),
                    ],
                  ),
                ),
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
            elevation: 0,
            // margin: EdgeInsets.all(5),
          ),
        ),
      );
    });
  }
}
