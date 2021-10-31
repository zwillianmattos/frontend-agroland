import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agro_tools/app/core/consts/colors.dart';
import 'package:agro_tools/app/core/widgets/widgets.dart';
import 'package:agro_tools/app/modules/main/submodules/education/cultures/models/culture.dart';
import 'package:agro_tools/app/modules/main/submodules/education/cultures/page/cultures_list_store.dart';
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
      backgroundColor: color_app_background,
      appBar: AppBar(
        title: Text('Diagnóstico'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Observer(builder: (_) {
        if (controller.isLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (controller.cultures == null)
          return RetryWidget(
            onRetry: controller.loadCultures,
          );

        return ListView.builder(
            itemCount: controller.cultures?.length,
            itemBuilder: (_, index) {
              Culture _culture = controller.cultures![index];

              return Container(
                margin: EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 10.0, top: 10.0),
                padding: EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    Modular.to.pushNamed("/cultures/${_culture.id}/categories",
                        forRoot: (IO.Platform.isAndroid || IO.Platform.isIOS)
                            ? true
                            : false);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (_culture.icon != null) _culture.icon,
                      text(
                        "${_culture.name}",
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
