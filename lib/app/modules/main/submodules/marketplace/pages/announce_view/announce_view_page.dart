import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:plant_care/app/modules/main/submodules/marketplace/pages/announce_view/announce_view_store.dart';
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
        title: Text('Marketplace Announce'),
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: text("Dados Basicos"),
            ),
            appEditTextStyle("Titulo",
                isPassword: false,
                initialValue: controller.productSell.title ?? "",
                keyboardType: TextInputType.text, onValidation: (text) {
              if (text == '') return 'O campo não pode ficar vazio';
            }, onSaved: (text) {
              controller.productSell.title = text;
            }).paddingAll(spacing_standard_new),
            appEditTextStyle("Price",
                isPassword: false,
                initialValue: controller.productSell.price ?? "",
                keyboardType: TextInputType.text, onValidation: (text) {
              if (text == '') return 'O campo não pode ficar vazio';
            }, onSaved: (text) {
              controller.productSell.price = text;
            }).paddingAll(spacing_standard_new),
            appEditTextStyle("Description",
                isPassword: false,
                initialValue: controller.productSell.description ?? "",
                keyboardType: TextInputType.text, onValidation: (text) {
              if (text == '') return 'O campo não pode ficar vazio';
            }, onSaved: (text) {
              controller.productSell.description = text;
            }).paddingAll(spacing_standard_new),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                appButton2(
                  radius: 8,
                  textContent: "Adicionar",
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
