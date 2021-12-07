import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agro_tools/app/core/widgets/widgets.dart';
import 'package:agro_tools/app/modules/main/submodules/education/cultures/models/culture.dart';
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
        title: Observer(builder: (_) {
          return text('${controller.culture?.name ?? ""}');
        }),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Observer(builder: (_) {
        if (controller.culture == null) {
          return Center(child: CircularProgressIndicator());
        }

        Culture _culture = controller.culture!;

        return ListView.builder(
            itemCount: _culture.culturesCategoriesRels?.length ?? 0,
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {
                  Modular.to.pushNamed(
                      "/cultures/${_culture.id}/${_culture.culturesCategoriesRels?[index].cultureCategory}/items",
                      forRoot: (IO.Platform.isAndroid || IO.Platform.isIOS)
                          ? true
                          : false,
                      arguments: _culture.culturesCategoriesRels?[index]);
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
                      if (_culture.icon != null) _culture.icon,
                      text(
                        "${_culture.culturesCategoriesRels?[index].culturesCategory?.description}",
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
