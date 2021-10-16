import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:plant_care/app/modules/main/submodules/marketplace/models/product_sell.dart';
import 'package:plant_care/app/modules/main/submodules/marketplace/pages/shop_view/marketplace_view_account_store.dart';

import '../../widgets.dart';

class MarketplaceViewAccountPage extends StatefulWidget {
  const MarketplaceViewAccountPage({Key? key}) : super(key: key);

  @override
  _MarketplaceViewAccountPageState createState() =>
      _MarketplaceViewAccountPageState();
}

class _MarketplaceViewAccountPageState extends ModularState<
    MarketplaceViewAccountPage, MarketplaceViewAccoutStore> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                // image: DecorationImage(
                //   image: NetworkImage(
                //       "https://deo.shopeemobile.com/shopee/shopee-mobilemall-live-sg/shop/f2575b4929b32ab70bf3b98ebb2aa6eb.png"),
                //   fit: BoxFit.cover,
                //   colorFilter: new ColorFilter.mode(
                //       Colors.black.withOpacity(1.0), BlendMode.softLight),
                // ),
                color: Colors.greenAccent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          if (controller.logista.imgLogo != null)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipOval(
                                child: Image.network(
                                  controller.logista.imgLogo!,
                                  width: 42,
                                ),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 24.0, right: 8.0, top: 8.0, bottom: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                text(
                                    "${controller.logista.fantasyName ?? controller.logista.corporateName}",
                                    fontSize: textSizeNormal,
                                    textColor: color_white,
                                    isLongText: true),
                                text("${controller.logista.phone!}",
                                    fontSize: textSizeSmall,
                                    textColor: color_white),
                                text("${controller.logista.cnpj}",
                                    fontSize: textSizeSmall,
                                    textColor: color_white),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: text("${controller.logista.description}",
                  fontSize: textSizeSmall, maxLine: 10, justifyText: true),
            ),
            DefaultTabController(
              length: 1,
              initialIndex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: TabBar(
                      indicatorPadding: EdgeInsets.only(left: 16, right: 16),
                      indicatorWeight: 2.0,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelStyle: TextStyle(
                        fontFamily: fontMedium,
                        fontSize: textSizeSMedium,
                      ),
                      indicatorColor: Theme.of(context).colorScheme.secondary,
                      unselectedLabelColor:
                          Theme.of(context).secondaryHeaderColor,
                      labelColor: Theme.of(context).colorScheme.secondary,
                      labelPadding: EdgeInsets.only(
                          left: spacing_large, right: spacing_large),
                      tabs: [
                        Tab(child: text("Todos os Produtos")),
                      ],
                    ),
                  ),
                  Container(
                    height: 500,
                    child: TabBarView(
                      children: [
                        Container(
                          child: Observer(builder: (_) {
                            if (controller.products == null) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            final List<ProductSell> items =
                                controller.products!;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: StaggeredGridView.countBuilder(
                                primary: false,
                                crossAxisCount: 4,
                                mainAxisSpacing: 4,
                                crossAxisSpacing: 4,
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: items.length,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        CardAnuncio(
                                  classificado: items[index],
                                ),
                                staggeredTileBuilder: (index) => width > 500
                                    ? const StaggeredTile.fit(1)
                                    : const StaggeredTile.fit(2),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
