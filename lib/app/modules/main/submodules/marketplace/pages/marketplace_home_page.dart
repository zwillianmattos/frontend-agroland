import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:plant_care/app/modules/account/models/user.dart';
import 'package:plant_care/app/modules/main/submodules/marketplace/models.dart';
import 'package:plant_care/app/modules/main/submodules/marketplace/models/product_sell.dart';
import 'package:plant_care/app/modules/main/submodules/marketplace/pages/marketplace_home_store.dart';
import 'package:relative_scale/relative_scale.dart';

import '../widgets.dart';

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
        drawer: new Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: color_colorPrimary,
                ),
                accountName: Text("Willian Mattos"),
                accountEmail: Text("willian_mattos@hotmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "W",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Inicio"),
                  onTap: () {
                    debugPrint('toquei no drawer');
                  }),
              ListTile(
                  leading: Icon(Icons.search),
                  title: Text("Buscar"),
                  onTap: () {
                    debugPrint('toquei no drawer');
                  }),
              ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text("Notificacoes"),
                  onTap: () {
                    debugPrint('toquei no drawer');
                  }),
              ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text("Favoritos"),
                  onTap: () {
                    debugPrint('toquei no drawer');
                  }),
              ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Minha conta"),
                  onTap: () {
                    debugPrint('toquei no drawer');
                  }),
              ListTile(
                  leading: Icon(Icons.money),
                  title: Text("Vender"),
                  onTap: () {
                    debugPrint('toquei no drawer');
                  }),
            ],
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: color_app_background,
          centerTitle: true,
          title: text("Marketplace",
              fontSize: 20.0, textColor: color_textColorPrimary),
          leading: IconButton(
              icon: SvgPicture.asset(
                "images/user_broken.svg",
              ),
              onPressed: () {}),
          actions: <Widget>[
            IconButton(
                icon: SvgPicture.asset(
                  "images/search_broken.svg",
                ),
                onPressed: () {
                  Modular.to.pushNamed('/education/search', forRoot: true);
                }),
          ],
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 45),
            child: Align(
              alignment: Alignment.topLeft,
              child: TabBar(
                indicatorPadding: EdgeInsets.only(left: 30, right: 30),
                indicatorWeight: 3.0,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: TextStyle(
                  fontFamily: fontMedium,
                  fontSize: textSizeNormal,
                ),
                indicatorColor: color_colorPrimary,
                unselectedLabelColor: color_textColorPrimary,
                labelColor: color_colorPrimary,
                labelPadding:
                    EdgeInsets.only(left: spacing_large, right: spacing_large),
                tabs: [
                  Tab(
                    text: "Tela inicial",
                  )
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            RefreshIndicator(
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
                            color: color_white,
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
                                offset:
                                    Offset(0, 0), // changes position of shadow
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
                            color: color_white,
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
                                offset:
                                    Offset(0, 0), // changes position of shadow
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
                            color: color_white,
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
                                offset:
                                    Offset(0, 0), // changes position of shadow
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
                            color: color_white,
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
                                offset:
                                    Offset(0, 0), // changes position of shadow
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
                            color: color_white,
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
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: true ? color_colorPrimary : white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.15),
                                    spreadRadius: 0,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: IconButton(
                                  tooltip: "Fertilizantes",
                                  padding: EdgeInsets.all(16.0),
                                  icon: SvgPicture.asset(
                                    "images/cotacao/cotton.svg",
                                    color: true ? white : black,
                                  ),
                                  onPressed: () {}),
                            ),
                            text("Fertilizantes", fontSize: 10.0),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: false ? color_colorPrimary : white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.15),
                                    spreadRadius: 0,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: IconButton(
                                  tooltip: "Fertilizantes",
                                  padding: EdgeInsets.all(16.0),
                                  icon: SvgPicture.asset(
                                    "images/cotacao/cotton.svg",
                                    color: false ? white : black,
                                  ),
                                  onPressed: () {}),
                            ),
                            text("Fertilizantes", fontSize: 10.0),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: false ? color_colorPrimary : white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.15),
                                    spreadRadius: 0,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: IconButton(
                                  tooltip: "Fertilizantes",
                                  padding: EdgeInsets.all(16.0),
                                  icon: SvgPicture.asset(
                                    "images/cotacao/cotton.svg",
                                    color: false ? white : black,
                                  ),
                                  onPressed: () {}),
                            ),
                            text("Fertilizantes", fontSize: 10.0),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: false ? color_colorPrimary : white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.15),
                                    spreadRadius: 0,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: IconButton(
                                  tooltip: "Fertilizantes",
                                  padding: EdgeInsets.all(16.0),
                                  icon: SvgPicture.asset(
                                    "images/cotacao/cotton.svg",
                                    color: false ? white : black,
                                  ),
                                  onPressed: () {}),
                            ),
                            text("Fertilizantes", fontSize: 10.0),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: false ? color_colorPrimary : white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.15),
                                    spreadRadius: 0,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: IconButton(
                                  tooltip: "Fertilizantes",
                                  padding: EdgeInsets.all(16.0),
                                  icon: SvgPicture.asset(
                                    "images/cotacao/cotton.svg",
                                    color: false ? white : black,
                                  ),
                                  onPressed: () {}),
                            ),
                            text("Fertilizantes", fontSize: 10.0),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Observer(builder: (_) {
                      if (controller.products == null) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
