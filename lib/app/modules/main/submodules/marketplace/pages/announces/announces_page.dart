import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/pages/announces/announces_store.dart';
import 'package:universal_io/io.dart' as IO;

class MarketplaceAnnouncesPage extends StatefulWidget {
  const MarketplaceAnnouncesPage({Key? key}) : super(key: key);

  @override
  _MarketplaceAnnouncesPageState createState() =>
      _MarketplaceAnnouncesPageState();
}

class _MarketplaceAnnouncesPageState
    extends ModularState<MarketplaceAnnouncesPage, MarketplaceAnnouncesStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Marketplace Announces'),
      ),
      body: Observer(builder: (_) {
        if (controller.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: controller.announces!.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(controller.announces![index].title.toString()),
              subtitle: Text("R\$ ${controller.announces![index].price}"),
              onTap: () async {
                await Modular.to.pushNamed('/marketplace/announces/new',
                    forRoot: (IO.Platform.isAndroid || IO.Platform.isIOS)
                        ? true
                        : false,
                    arguments: controller.announces![index]);
                await controller.loadAnnounces();
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Modular.to.pushNamed('/marketplace/announces/new',
              forRoot:
                  (IO.Platform.isAndroid || IO.Platform.isIOS) ? true : false);
          await controller.loadAnnounces();
        },
        isExtended: true,
      ),
    );
  }
}
