import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/acoes/models/icon_cotacao_model.dart';
import 'package:relative_scale/relative_scale.dart';
import './cotacao_store.dart';
import './cotacao_widget.dart';

class CotacaoWidget extends StatefulWidget {
  const CotacaoWidget({Key? key}) : super(key: key);

  @override
  _CotacaoWidgetState createState() => _CotacaoWidgetState();
}

class _CotacaoWidgetState extends ModularState<CotacaoWidget, CotacaoStore> {
  @override
  Widget build(BuildContext context) {
    final List<IconCotacaoModel> cotacoes = List<IconCotacaoModel>.of([
      IconCotacaoModel(
          icon: "images/cotacao/cotton.svg",
          slug: "algodao",
          descricao: "Algodão"),
      IconCotacaoModel(
          icon: "images/cotacao/wheat.svg", slug: "arroz", descricao: "Arroz"),
      IconCotacaoModel(
          icon: "images/cotacao/coffee.svg", slug: "cafe", descricao: "Café"),
      IconCotacaoModel(
          icon: "images/cotacao/bamboo-canes.svg",
          slug: "cana",
          descricao: "Cana"),
      IconCotacaoModel(
          icon: "images/cotacao/graos.svg",
          slug: "feijao",
          descricao: "Feijão"),
      IconCotacaoModel(
          icon: "images/cotacao/corn.svg", slug: "milho", descricao: "Milho"),
      IconCotacaoModel(
          icon: "images/cotacao/Soy.svg", slug: "soja", descricao: "Soja"),
      IconCotacaoModel(
          icon: "images/cotacao/wheat-1.svg",
          slug: "sorgo",
          descricao: "Sorgo"),
      IconCotacaoModel(
          icon: "images/cotacao/trigo.svg", slug: "trigo", descricao: "Trigo"),
      IconCotacaoModel(
          icon: "images/cotacao/animal.svg",
          slug: "boi",
          descricao: "Boi Gordo"),
      IconCotacaoModel(
          icon: "images/cotacao/cow.svg",
          slug: "vaca-gorda",
          descricao: "Vaca Gorda"),
      IconCotacaoModel(
          icon: "images/cotacao/hen.svg", slug: "frango", descricao: "Frango"),
      IconCotacaoModel(
          icon: "images/cotacao/milk-bottle.svg",
          slug: "leite",
          descricao: "Leite"),
      IconCotacaoModel(
          icon: "images/cotacao/Pig.svg", slug: "suino", descricao: "Suíno"),
      // IconCotacaoModel(
      //   icon: "images/cotacao/money.svg",
      //   slug: "mercado-financeiro",
      // ),
    ]);

    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Column(
        children: [
          Observer(builder: (_) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  children: cotacoes
                      .map(
                        (e) => Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: controller.slugSelected == e.slug
                                    ? color_colorPrimary
                                    : white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.15),
                                    spreadRadius: 0,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: IconButton(
                                  tooltip: e.descricao,
                                  padding: EdgeInsets.all(16.0),
                                  icon: SvgPicture.asset(
                                    e.icon,
                                    color: controller.slugSelected == e.slug
                                        ? white
                                        : black,
                                  ),
                                  onPressed: () {
                                    controller.selectCotacao(e.slug);
                                  }),
                            ),
                            text(e.descricao, fontSize: 10.0),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            );
          }),
          SizedBox(height: 20),
          Observer(builder: (_) {
            if (controller.loading) {
              return Container(
                width: sx(width) > 400 ? sx(width) / 2 : width,
                margin:
                    EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 0),
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
                height: 200,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            return Column(children: [
              Container(
                width: sx(width) > 400 ? sx(width) / 2 : width,
                margin:
                    EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 0),
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
                child: Observer(builder: (_) {
                  return Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: text(
                        controller.cotacao!.description.toString(),
                        maxLine: 5,
                        fontFamily: fontBold,
                      ),
                    ),
                    Column(
                        children: controller.cotacao!.cultures!
                            .map((e) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: text(e.description.toString(),
                                          fontFamily: fontBold,
                                          textColor: color_white,
                                          fontSize: 16.0,
                                          maxLine: 5),
                                      color: color_colorPrimary,
                                      width: width,
                                      padding: EdgeInsets.all(8.0),
                                    ),
                                    Column(
                                        children: e.data!
                                            .map((ee) => ListTile(
                                                  title: text(
                                                      ee.city.toString(),
                                                      fontSize: 14.0),
                                                  subtitle: text(
                                                      "R\$ ${ee.price!.toStringAsFixed(2)}",
                                                      fontSize: 14.0),
                                                ))
                                            .toList()),
                                  ],
                                ))
                            .toList())
                  ]);
                }),
              ),
              SizedBox(height: 20),
            ]);
          }),
        ],
      );
    });
  }
}
