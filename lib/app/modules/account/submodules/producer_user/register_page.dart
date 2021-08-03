import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'producer_user_register_store.dart';

class ProducerUserRegisterPage extends StatefulWidget {
  const ProducerUserRegisterPage({Key? key}) : super(key: key);

  @override
  _ProducerUserRegisterPageState createState() =>
      _ProducerUserRegisterPageState();
}

class _ProducerUserRegisterPageState
    extends ModularState<ProducerUserRegisterPage, ProducerUserRegisterStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Producer User Register'),
      ),
      body: Container(
        child: Observer(builder: (c) {
          return Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: text("Dados Basicos"),
                  ),
                  appEditTextStyle("Razao Social",
                      isPassword: false,
                      keyboardType: TextInputType.text, onValidation: (text) {
                    if (text == '') return 'O campo não pode ficar vazio';
                  }, onSaved: (text) {
                    controller.producerUser.corporateName = text;
                  }).paddingAll(spacing_standard_new),
                  appEditTextStyle("Nome Fantasia",
                      isPassword: false,
                      keyboardType: TextInputType.text, onValidation: (text) {
                    if (text == '') return 'O campo não pode ficar vazio';
                  }, onSaved: (text) {
                    controller.producerUser.fantasyName = text;
                  }).paddingAll(spacing_standard_new),
                  appEditTextStyle("CNPJ",
                      isPassword: false,
                      keyboardType: TextInputType.text, onValidation: (text) {
                    if (text == '') return 'O campo não pode ficar vazio';
                  }, onSaved: (text) {
                    controller.producerUser.cnpj = text;
                  }).paddingAll(spacing_standard_new),
                  appButton(
                    textContent: "Adicionar Foto",
                    onPressed: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: text("Endereco da loja"),
                  ),
                  appEditTextStyle("Endereco",
                      isPassword: false,
                      keyboardType: TextInputType.text, onValidation: (text) {
                    if (text == '') return 'O campo não pode ficar vazio';
                  }, onSaved: (text) {
                    controller.producerUserAddress.address = text;
                  }).paddingAll(spacing_standard_new),
                  appEditTextStyle("Numero",
                      isPassword: false,
                      keyboardType: TextInputType.text, onValidation: (text) {
                    if (text == '') return 'O campo não pode ficar vazio';
                  }, onSaved: (text) {
                    controller.producerUserAddress.number = text;
                  }).paddingAll(spacing_standard_new),
                  appEditTextStyle("Bairro",
                      isPassword: false,
                      keyboardType: TextInputType.text, onValidation: (text) {
                    if (text == '') return 'O campo não pode ficar vazio';
                  }, onSaved: (text) {
                    controller.producerUserAddress.district = text;
                  }).paddingAll(spacing_standard_new),
                  appEditTextStyle("Estado",
                      isPassword: false,
                      keyboardType: TextInputType.text, onValidation: (text) {
                    if (text == '') return 'O campo não pode ficar vazio';
                  }, onSaved: (text) {
                    controller.producerUserAddress.state = text;
                  }).paddingAll(spacing_standard_new),
                  appEditTextStyle("Cidade",
                      isPassword: false,
                      keyboardType: TextInputType.text, onValidation: (text) {
                    if (text == '') return 'O campo não pode ficar vazio';
                  }, onSaved: (text) {
                    controller.producerUserAddress.city = text;
                  }).paddingAll(spacing_standard_new),
                  appEditTextStyle("CEP",
                      isPassword: false,
                      keyboardType: TextInputType.text, onValidation: (text) {
                    if (text == '') return 'O campo não pode ficar vazio';
                  }, onSaved: (text) {
                    controller.producerUserAddress.zipCode = text;
                  }).paddingAll(spacing_standard_new),
                  appEditTextStyle("Referencia",
                      isPassword: false,
                      keyboardType: TextInputType.text, onValidation: (text) {
                    if (text == '') return 'O campo não pode ficar vazio';
                  }, onSaved: (text) {
                    controller.producerUserAddress.reference = text;
                  }).paddingAll(spacing_standard_new),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: text("Redes Sociais"),
                  ),
                  appEditTextStyle("facebook",
                      isPassword: false,
                      keyboardType: TextInputType.text, onValidation: (text) {
                    if (text == '') return 'O campo não pode ficar vazio';
                  }, onSaved: (text) {
                    controller.producerUser.facebook = text;
                  }).paddingAll(spacing_standard_new),
                  appEditTextStyle("instagram",
                      isPassword: false,
                      keyboardType: TextInputType.text, onValidation: (text) {
                    if (text == '') return 'O campo não pode ficar vazio';
                  }, onSaved: (text) {
                    controller.producerUser.instagram = text;
                  }).paddingAll(spacing_standard_new),
                  appEditTextStyle("whatsapp",
                      isPassword: false,
                      keyboardType: TextInputType.text, onValidation: (text) {
                    if (text == '') return 'O campo não pode ficar vazio';
                  }, onSaved: (text) {
                    controller.producerUser.whatsapp = text;
                  }).paddingAll(spacing_standard_new),
                  appEditTextStyle("twitter",
                      isPassword: false,
                      keyboardType: TextInputType.text, onValidation: (text) {
                    if (text == '') return 'O campo não pode ficar vazio';
                  }, onSaved: (text) {
                    controller.producerUser.twitter = text;
                  }).paddingAll(spacing_standard_new),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      appButton2(
                        radius: 8,
                        textContent: "Proximo",
                        onPressed: (() {
                          controller.register();
                        }),
                      ).paddingOnly(
                          right: spacing_standard_new,
                          bottom: spacing_standard_new)
                    ],
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
