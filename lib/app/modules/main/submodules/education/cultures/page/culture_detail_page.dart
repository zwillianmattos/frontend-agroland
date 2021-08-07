import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/modules/main/submodules/education/cultures/page/culture_detail_store.dart';
import 'package:universal_io/io.dart' as IO;

class CultureDetailPage extends StatefulWidget {
  const CultureDetailPage({Key? key}) : super(key: key);

  @override
  _CultureDetailPageState createState() => _CultureDetailPageState();
}

class _CultureDetailPageState
    extends ModularState<CultureDetailPage, CulturesDetailStore> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          return Text(
              '${controller.culturesCategoriesRels?.culturesCategory?.description ?? ""}');
        }),
      ),
      body: Observer(builder: (_) {
        if (controller.isLoading)
          return Center(
            child: CircularProgressIndicator(),
          );

        return ListView.builder(
            itemCount:
                controller.culturesCategoriesRels?.culturesContents?.length,
            itemBuilder: (_, i) {
              return ListTile(
                title: Text(
                    "${controller.culturesCategoriesRels?.culturesContents?[i].description}"),
                onTap: () {
                  Modular.to.pushNamed(
                      "/cultures/${controller.culturesCategoriesRels?.culture}/${controller.culturesCategoriesRels?.cultureCategory}/item/${controller.culturesCategoriesRels?.culturesContents?[i].id}/view",
                      forRoot: (IO.Platform.isAndroid || IO.Platform.isIOS)
                          ? true
                          : false,
                      arguments: controller
                          .culturesCategoriesRels?.culturesContents?[i]);
                },
              );
            });
      }),
    );
  }
}
