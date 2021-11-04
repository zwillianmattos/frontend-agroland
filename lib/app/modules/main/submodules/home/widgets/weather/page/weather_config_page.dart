import 'package:agro_tools/app/core/consts/colors.dart';
import 'package:agro_tools/app/core/consts/texts.dart';
import 'package:agro_tools/app/core/widgets/widgets.dart';
import 'package:agro_tools/app/modules/main/submodules/home/widgets/weather/models/weather.dart';
import 'package:agro_tools/app/modules/main/submodules/home/widgets/weather/page/weather_config_store.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:universal_io/io.dart' as IO;

class WeatherConfigPage extends StatefulWidget {
  const WeatherConfigPage({Key? key}) : super(key: key);

  @override
  _WeatherConfigPageState createState() => _WeatherConfigPageState();
}

class _WeatherConfigPageState
    extends ModularState<WeatherConfigPage, WeatherConfigStore> {
  Future<void> _exibeListaEstados() async {
    await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext bc) {
          return Observer(builder: (_) {
            if (controller.estados == null)
              return RetryWidget(
                onRetry: controller.carregaEstados,
              );

            if (controller.isLoading)
              return Center(
                child: CircularProgressIndicator(),
              );

            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  headingWidViewAll(context, "Selecione o seu estado", () {
                    Navigator.pop(context);
                  }, itemSubText: "Voltar"),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Observer(builder: (_) {
                      return TextFormField(
                          controller: controller.searchEstadoController,
                          textInputAction: TextInputAction.search,
                          style: TextStyle(
                              fontFamily: fontRegular,
                              fontSize: textSizeSMedium,
                              color: color_textColorPrimary),
                          decoration: InputDecoration(
                            hintText: "Buscar estado",
                            hintStyle: TextStyle(
                                fontFamily: fontRegular,
                                color: color_textColorSecondary),
                            border: InputBorder.none,
                            filled: false,
                          ),
                          onFieldSubmitted: (term) {
                            controller.searchEstado(term);
                          });
                    }),
                  ),
                  Expanded(
                    child: Observer(builder: (_) {
                      return ListView.builder(
                          itemCount: controller.estadosFiltrado!.length,
                          itemBuilder: (_, index) => ListTile(
                                onTap: () async {
                                  await controller.carregaCidadePorEstado(
                                      controller.estadosFiltrado![index]);
                                  Navigator.pop(context);
                                  await _exibeListaCidades();
                                },
                                title: text(
                                    "${controller.estadosFiltrado![index].sigla} - ${controller.estadosFiltrado![index].nome}"),
                              ));
                    }),
                  ),
                ],
              ),
            );
          });
        });
  }

  Future<void> _exibeListaCidades() async {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext bc) {
          return Observer(builder: (_) {
            if (controller.cidades == null)
              return RetryWidget(
                callBack: () {
                  Navigator.pop(context);
                },
              );
            if (controller.isLoading)
              return Center(
                child: CircularProgressIndicator(),
              );

            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  headingWidViewAll(context, "Selecione o sua cidade",
                      () async {
                    Navigator.pop(context);
                    _exibeListaEstados();
                  }, itemSubText: "Voltar"),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Observer(builder: (_) {
                      return TextFormField(
                          controller: controller.searchCidadeController,
                          textInputAction: TextInputAction.search,
                          style: TextStyle(
                              fontFamily: fontRegular,
                              fontSize: textSizeSMedium,
                              color: color_textColorPrimary),
                          decoration: InputDecoration(
                            hintText: "Buscar cidade",
                            hintStyle: TextStyle(
                                fontFamily: fontRegular,
                                color: color_textColorSecondary),
                            border: InputBorder.none,
                            filled: false,
                          ),
                          onFieldSubmitted: (term) {
                            controller.searchCidade(term);
                          });
                    }),
                  ),
                  Expanded(
                    child: Observer(builder: (_) {
                      if (controller.isLoading)
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      return ListView.builder(
                          itemCount: controller.cidadesFiltrado!.length,
                          itemBuilder: (_, index) => ListTile(
                                onTap: () async {
                                  await controller.addLocation(
                                      controller.cidadesFiltrado![index]);
                                  Navigator.pop(context);
                                },
                                title: text(
                                    "${controller.cidadesFiltrado![index].nome}"),
                              ));
                    }),
                  ),
                ],
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: text("Minhas Regiões"),
        actions: [
          IconButton(
              onPressed: () async {
                await _exibeListaEstados();
              },
              icon: Icon(Icons.add_location))
        ],
      ),
      body: Observer(builder: (_) {
        if (controller.isLoading)
          return Center(child: CircularProgressIndicator());

        return ListView(
          itemExtent: 100,
          children: controller.localizacoesLista!
              .map((Weather element) => InkWell(
                    onLongPress: () {
                      controller.removeLocation(element);
                    },
                    child: Card(
                      child: Column(
                        children: [
                          text(
                              "${element.results?.cid == 'local_atual' ? 'Local Atual - ' : ''} ${element.results?.cityName} "),
                          text(
                            "${element.results?.temp}",
                            fontSize: 32,
                          ),
                        ],
                      ),
                    ),
                  ))
              .toList(),
        );
      }),
      // body: Observer(builder: (_) {
      //   if (controller.isLoading)
      //     return Center(
      //       child: CircularProgressIndicator(),
      //     );

      //   return ListView.builder(
      //       itemCount: controller.estadoModel!.length,
      //       itemBuilder: (_, index) => ListTile(
      //             onTap: () {},
      //             title: text("${controller.estadoModel![index].nome} - ${controller.estadoModel![index].sigla}"),
      //           ));
      // }),
    );
  }
}
