import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/core/models/account.dart';
import 'package:plant_care/app/core/utils/user_preferences_store.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:plant_care/app/modules/main/submodules/marketplace/models/product_sell.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:universal_io/io.dart' as IO;

class CategoriaWidget extends StatefulWidget {
  final String description;

  const CategoriaWidget({Key? key, required this.description})
      : super(key: key);

  @override
  _CategoriaWidgetState createState() => _CategoriaWidgetState();
}

class _CategoriaWidgetState extends State<CategoriaWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: Text(widget.description),
        onPressed: () {},
      ),
    );
  }
}

class BuscaWidget extends StatelessWidget {
  const BuscaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 16, top: 16),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3100)),
          color: white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 2,
              blurRadius: 19,
              offset: Offset(4, 6), // changes position of shadow
            ),
          ],
        ),
        child: TextField(
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              fillColor: color_white,
              hintText: "Buscar",
              border: InputBorder.none,
              prefixIcon: Icon(Typicons.search_outline),
              contentPadding: EdgeInsets.only(
                  left: 26.0, bottom: 8.0, top: 8.0, right: 50.0),
            )),
        alignment: Alignment.center,
      ),
    );
  }
}

class CardAnuncio extends StatelessWidget {
  final ProductSell classificado;

  const CardAnuncio({
    Key? key,
    required this.classificado,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return SizedBox(
        child: InkWell(
          onTap: () {
            Modular.to.pushNamed('/marketplace/view',
                arguments: classificado,
                forRoot: (IO.Platform.isAndroid || IO.Platform.isIOS)
                    ? true
                    : false);
          },
          child: Container(
            padding: EdgeInsets.all(6.0),
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Theme.of(context).backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    if (classificado.productCategories!.length > 0)
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: spacing_control, right: spacing_control),
                          decoration: boxDecoration(
                              radius: spacing_control,
                              bgColor:  Theme.of(context).primaryColor,),
                          child: text(
                              classificado
                                      .productCategories!.first.description ??
                                  " - ",
                              fontSize: textSizeSmall,
                              isCentered: true,
                              isLongText: true,
                              textColor: Theme.of(context).textTheme.bodyText1!.color),
                        ),
                      ),
                    Expanded(child: Container()),
                    Expanded(
                        child: Icon(Icons.favorite_border,
                            color: color_icon_color))
                  ],
                ),
                SizedBox(height: 4),
                Align(
                  alignment: Alignment.center,
                  child: CachedNetworkImage(
                    placeholder: (context, url) => Image.asset(
                        'images/LikeButton/image/grey.jpg',
                        fit: BoxFit.cover),
                    imageUrl: classificado.productSellPhotos!.first.imgPath!,
                    fit: BoxFit.contain,
                    height: sy(height) * 0.10,
                    width: sx(width) * 0.25,
                  ),
                ),
                SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.only(left: 4, right: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      text("R\$ ${classificado.price}",
                          fontSize: textSizeSmall,
                          textColor: color_textColorSecondary,
                          maxLine: 2),
                      text(classificado.title!, maxLine: 1, fontSize: 12.0),
                    ],
                  ),
                ),
                SizedBox(height: 4),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class MarketplaceDrawer extends StatefulWidget {
  const MarketplaceDrawer({Key? key}) : super(key: key);

  @override
  _MarketplaceDrawerState createState() => _MarketplaceDrawerState();
}

class _MarketplaceDrawerState extends State<MarketplaceDrawer> {
  late final AccountModel? accountModel;

  @override
  void initState() {
    // TODO: implement initState
    accountModel = Modular.get<UserPreferencesStore>().accountModel;
  }

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: color_colorPrimary,
            ),
            accountName: text(accountModel?.user?.name ?? "Bem Vindo"),
            accountEmail: text(
              accountModel?.user?.email ??
                  "Entra na sua conta para ver suas compras, favoritos etc.",
              maxLine: 2,
              fontSize: 12.0,
            ),
            currentAccountPicture: accountModel?.user != null
                ? CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      accountModel?.user?.name?[0] ?? "",
                      style: TextStyle(fontSize: 40.0),
                    ),
                  )
                : null,
          ),
          if (accountModel?.token == null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  appButton(
                    textContent: "Login",
                    onPressed: () {
                      Modular.to.pushNamed('/account/auth',
                          forRoot: (IO.Platform.isAndroid || IO.Platform.isIOS)
                              ? true
                              : false,
                          arguments: {
                            'isSignIn': true,
                            'isSignUp': false,
                          });
                    },
                  ),
                  Divider(),
                  appButton3(
                    textContent: "Crie sua conta",
                    onPressed: () {
                      Modular.to.pushNamed('/account/auth',
                          forRoot: (IO.Platform.isAndroid || IO.Platform.isIOS)
                              ? true
                              : false,
                          arguments: {
                            'isSignIn': false,
                            'isSignUp': true,
                          });
                    },
                  ),
                ],
              ),
            ),
          // ListTile(
          //     leading: Icon(Icons.home),
          //     title: Text("Inicio"),
          //     onTap: () {
          //       debugPrint('toquei no drawer');
          //     }),
          // ListTile(
          //     leading: Icon(Icons.search),
          //     title: Text("Buscar"),
          //     onTap: () {
          //       debugPrint('toquei no drawer');
          //     }),
          // ListTile(
          //     leading: Icon(Icons.notifications),
          //     title: Text("Notificacoes"),
          //     onTap: () {
          //       debugPrint('toquei no drawer');
          //     }),
          ListTile(
              leading: Icon(Icons.favorite),
              title: Text("Favoritos"),
              onTap: () {
                debugPrint('toquei no drawer');
              }),
          ListTile(
            leading: Icon(Icons.money),
            title: Text("Vender"),
            onTap: () {
              if (accountModel?.token != null) {
                if (accountModel?.user?.producerUser != null) {
                  Modular.to.pushNamed(
                    '/marketplace/announces',
                    forRoot: (IO.Platform.isAndroid || IO.Platform.isIOS)
                        ? true
                        : false,
                  );
                } else {
                  Modular.to.pushNamed(
                    '/account/producer_user/register',
                    forRoot: (IO.Platform.isAndroid || IO.Platform.isIOS)
                        ? true
                        : false,
                  );
                }
              } else {
                Modular.to.pushNamed('/account/auth',
                    forRoot: (IO.Platform.isAndroid || IO.Platform.isIOS)
                        ? true
                        : false);
              }
            },
          ),
          if (Modular.get<UserPreferencesStore>().getUser != null)
            ListTile(
                leading: Icon(Icons.person),
                title: Text("Minha conta"),
                onTap: () {
                  Modular.to.pushNamed(
                    '/account/profile',
                    forRoot: (IO.Platform.isAndroid || IO.Platform.isIOS)
                        ? true
                        : false,
                  );
                }),
        ],
      ),
    );
  }
}
