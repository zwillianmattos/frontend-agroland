import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agro_tools/app/core/consts/texts.dart';
import 'package:agro_tools/app/core/widgets/widgets.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/pages/announce_view/announce_view_store.dart';
import 'package:nb_utils/nb_utils.dart';

class MarketplaceAnnounceViewPage extends StatefulWidget {
  const MarketplaceAnnounceViewPage({Key? key}) : super(key: key);

  @override
  _MarketplaceAnnounceViewPageState createState() =>
      _MarketplaceAnnounceViewPageState();
}

class _MarketplaceAnnounceViewPageState extends ModularState<
    MarketplaceAnnounceViewPage, MarketplaceAnnounceViewStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Anúncios'),
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: text("Dados Básicos"),
            ),
            appEditTextStyle("Título",
                isPassword: false,
                initialValue: controller.productSell.title ?? "",
                keyboardType: TextInputType.text, onValidation: (text) {
              if (text == '') return 'O campo não pode ficar vazio';
            }, onSaved: (text) {
              controller.productSell.title = text;
            }).paddingAll(spacing_standard_new),
            appEditTextStyle("Preço",
                isPassword: false,
                initialValue: controller.productSell.price ?? "",
                keyboardType: TextInputType.number, onValidation: (text) {
              if (text == '') return 'O campo não pode ficar vazio';
            }, onSaved: (text) {
              controller.productSell.price = text;
            }).paddingAll(spacing_standard_new),
            appEditTextStyle("Descrição",
                isPassword: false,
                initialValue: controller.productSell.description ?? "",
                maxLines: 10,
                keyboardType: TextInputType.text, onValidation: (text) {
              if (text == '') return 'O campo não pode ficar vazio';
            }, onSaved: (text) {
              controller.productSell.description = text;
            }).paddingAll(spacing_standard_new),
            SizedBox(
              height: 10,
            ),
            Observer(builder: (context) {
              if (controller.productSell.id == null ||
                  controller.productSell.id == 0) {
                return Container();
              }

              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: text("Fotos"),
                      ),
                      FlatButton(
                        onPressed: () {
                          controller.addPhoto();
                        },
                        child: Text(
                          "Adicionar",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: controller.images.map((e) {
                        return InkWell(
                          onLongPress: () {
                            controller.removePhoto(e);
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            child: Image.network(e, fit: BoxFit.cover),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              );
            }),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                appButton2(
                  radius: 8,
                  textContent: "Anunciar",
                  onPressed: (() {
                    controller.add();
                  }),
                ).paddingOnly(
                    right: spacing_standard_new, bottom: spacing_standard_new)
              ],
            )
          ],
        ),
      ),
    );
  }
}
