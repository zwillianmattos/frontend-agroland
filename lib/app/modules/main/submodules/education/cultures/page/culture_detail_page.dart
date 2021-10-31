import 'package:agro_tools/app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agro_tools/app/modules/main/submodules/education/cultures/page/culture_detail_store.dart';
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
          return text(
              '${controller.culturesCategoriesRels?.culturesCategory?.description ?? ""}');
        }),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
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
              return InkWell(
                onTap: () {
                  Modular.to.pushNamed(
                      "/cultures/${controller.culturesCategoriesRels?.culture}/${controller.culturesCategoriesRels?.cultureCategory}/item/${controller.culturesCategoriesRels?.culturesContents?[i].id}/view",
                      forRoot: (IO.Platform.isAndroid || IO.Platform.isIOS)
                          ? true
                          : false,
                      arguments: controller
                          .culturesCategoriesRels?.culturesContents?[i]);
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 10.0, top: 10.0),
                  padding: EdgeInsets.all(18.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Theme.of(context).dialogBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 0,
                        blurRadius: 5,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      text(
                        "${controller.culturesCategoriesRels?.culturesContents?[i].description}",
                        bold: true,
                        fontSize: 16,
                      ),
                    ],
                  ),
                ),
              );
            });
      }),
    );
  }
}
