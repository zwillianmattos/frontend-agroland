import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/modules/main/submodules/education/cultures/models/culture.dart';
import 'package:universal_io/io.dart' as IO;
import 'cultures_category_store.dart';

class CulturesCategoryPage extends StatefulWidget {
  const CulturesCategoryPage({Key? key}) : super(key: key);

  @override
  _CulturesCategoryPageState createState() => _CulturesCategoryPageState();
}

class _CulturesCategoryPageState
    extends ModularState<CulturesCategoryPage, CulturesCategoryStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Observer(builder: (_) {
          return Text('${controller.culture?.name ?? ""}');
        }),
      ),
      body: Observer(builder: (_) {
        if (controller.culture == null) {
          return Center(child: CircularProgressIndicator());
        }

        Culture _culture = controller.culture!;

        return ListView.builder(
            itemCount: _culture.culturesCategoriesRels?.length ?? 0,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(
                    "${_culture.culturesCategoriesRels?[index].culturesCategory?.description}"),
                onTap: () {
                  Modular.to.pushNamed(
                      "/cultures/${_culture.id}/${_culture.culturesCategoriesRels?[index].id}/items",
                      forRoot: (IO.Platform.isAndroid || IO.Platform.isIOS)
                          ? true
                          : false,
                      arguments: _culture.culturesCategoriesRels?[index]);
                },
              );
            });
      }),
    );
  }
}
