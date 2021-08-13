import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:plant_care/app/modules/main/submodules/marketplace/models/product_sell.dart';
import '../../widgets.dart';
import 'marketplace_home_store.dart';

class MarketplaceHomePage extends StatefulWidget {
  const MarketplaceHomePage({Key? key}) : super(key: key);

  @override
  _MarketplaceHomePageState createState() => _MarketplaceHomePageState();
}

class _MarketplaceHomePageState
    extends ModularState<MarketplaceHomePage, MarketplaceHomeStore>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    @protected
    @mustCallSuper
    void initState() {
      super.initState();
    }

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 1,
      child: Scaffold(
        drawer: MarketplaceDrawer(),
        appBar: AppBar(
          elevation: 0,
          // backgroundColor: color_app_background,
          centerTitle: true,
          title: text("Marketplace",
              fontSize: 20.0, textColor: color_textColorPrimary),
          actions: <Widget>[
            IconButton(
                icon: SvgPicture.asset(
                  "images/search_broken.svg",
                ),
                onPressed: () {
                  Modular.to.pushNamed('/marketplace/search', forRoot: false);
                }),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await controller.load();
            return;
          },
          child: ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            shrinkWrap: true,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 300,
                      height: 160,
                      margin: EdgeInsets.only(
                          left: 13, right: 13, bottom: 16, top: 16),
                      padding: EdgeInsets.only(
                          left: 16, right: 16, bottom: 16, top: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        // color: color_white,
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://cdn.awsli.com.br/400x400/1751/1751727/banner/4e8586365b.png"),
                          fit: BoxFit.fitWidth,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff000000).withOpacity(0.15),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 160,
                      margin: EdgeInsets.only(
                          left: 13, right: 13, bottom: 16, top: 16),
                      padding: EdgeInsets.only(
                          left: 16, right: 16, bottom: 16, top: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        // color: color_white,
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://cdn.awsli.com.br/400x400/1751/1751727/banner/78628d4761.png"),
                          fit: BoxFit.fitWidth,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff000000).withOpacity(0.15),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 160,
                      margin: EdgeInsets.only(
                          left: 13, right: 13, bottom: 16, top: 16),
                      padding: EdgeInsets.only(
                          left: 16, right: 16, bottom: 16, top: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        // color: color_white,
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://cdn.awsli.com.br/400x400/1751/1751727/banner/bdfdd8dd71.png"),
                          fit: BoxFit.fitWidth,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff000000).withOpacity(0.15),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 160,
                      margin: EdgeInsets.only(
                          left: 13, right: 13, bottom: 16, top: 16),
                      padding: EdgeInsets.only(
                          left: 16, right: 16, bottom: 16, top: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        // color: color_white,
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://http2.mlstatic.com/D_NQ_NP_801971-MLA46483020534_062021-C.webp"),
                          fit: BoxFit.fitWidth,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff000000).withOpacity(0.15),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 160,
                      margin: EdgeInsets.only(
                          left: 13, right: 13, bottom: 16, top: 16),
                      padding: EdgeInsets.only(
                          left: 16, right: 16, bottom: 16, top: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        // color: color_white,
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://http2.mlstatic.com/D_NQ_NP_663015-MLA46468719096_062021-B.webp"),
                          fit: BoxFit.fitHeight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff000000).withOpacity(0.15),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Observer(
                builder: (_) {
                  if (controller.categories == null) {
                    return Container();
                  }

                  return Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: controller.categories!
                              .map((element) => appButton2(
                                    onPressed: () {
                                      controller.selectCategory(element);
                                    },
                                    textContent: element.description.toString(),
                                    radius: 0.0,
                                    color: Theme.of(context).textTheme.bodyText1!.color,
                                    bgColors: controller.indexCategory ==
                                            controller.categories!
                                                .indexOf(element)
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(context).backgroundColor,
                                  ))
                              .toList()),
                    ),
                  );
                },
              ),
              appLabelViewAll("Mais Recentes"),
              Observer(builder: (_) {
                if (controller.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (controller.products == null)
                  return RetryWidget(
                    onRetry: controller.load,
                  );

                final List<ProductSell> items = controller.products!;

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
                    itemBuilder: (BuildContext context, int index) =>
                        CardAnuncio(
                      classificado: items[index],
                    ),
                    staggeredTileBuilder: (index) => width > 500
                        ? const StaggeredTile.fit(1)
                        : const StaggeredTile.fit(2),
                  ),
                );
              }),
              appLabelViewAll("Visto recentemente"),
              appLabelViewAll("Favoritos"),
            ],
          ),
        ),
      ),
    );
  }
}
