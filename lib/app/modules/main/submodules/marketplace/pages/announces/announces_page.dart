import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/modules/main/submodules/marketplace/pages/announces/announces_store.dart';

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
                    forRoot: true, arguments: controller.announces![index]);
                await controller.loadAnnounces();
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Modular.to
              .pushNamed('/marketplace/announces/new', forRoot: true);
          await controller.loadAnnounces();
        },
        isExtended: true,
      ),
    );
  }
}
