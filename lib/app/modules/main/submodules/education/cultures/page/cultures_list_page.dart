import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/modules/main/submodules/education/cultures/models/culture.dart';
import 'package:plant_care/app/modules/main/submodules/education/cultures/page/cultures_list_store.dart';
import 'package:universal_io/io.dart' as IO;

class CulturesListPage extends StatefulWidget {
  const CulturesListPage({Key? key}) : super(key: key);

  @override
  _CulturesListPageState createState() => _CulturesListPageState();
}

class _CulturesListPageState
    extends ModularState<CulturesListPage, CulturesListStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Culturas'),
      ),
      body: Observer(builder: (_) {
        if (controller.cultures == null) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
            itemCount: controller.cultures?.length,
            itemBuilder: (_, index) {
              Culture _culture = controller.cultures![index];

              return ListTile(
                title: Text("${_culture.name}"),
                trailing: _culture.icon ?? null,
                onTap: () {
                  Modular.to.pushNamed("/cultures/${_culture.id}/categories",
                      forRoot: (IO.Platform.isAndroid || IO.Platform.isIOS)
                          ? true
                          : false);
                },
              );
            });
      }),
    );
  }
}
