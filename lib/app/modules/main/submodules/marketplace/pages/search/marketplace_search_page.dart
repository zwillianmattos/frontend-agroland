import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:universal_io/io.dart' as IO;
import 'marketplace_search_store.dart';

class MarketplaceSearchPage extends StatefulWidget {
  const MarketplaceSearchPage({Key? key}) : super(key: key);

  @override
  _MarketplaceSearchPageState createState() => _MarketplaceSearchPageState();
}

class _MarketplaceSearchPageState
    extends ModularState<MarketplaceSearchPage, MarketplaceSearchStore> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: text("Pesquisar marketplace"),
          backgroundColor: color_colorPrimary,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 45),
            child: Container(
              height: 50,
              color: color_edit_background,
              padding: EdgeInsets.only(
                  left: spacing_standard_new, right: spacing_standard),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                        controller: controller.searchController,
                        textInputAction: TextInputAction.search,
                        style: TextStyle(
                            fontFamily: fontRegular,
                            fontSize: textSizeNormal,
                            color: color_textColorPrimary),
                        decoration: InputDecoration(
                          hintText: "Buscar",
                          hintStyle: TextStyle(
                              fontFamily: fontRegular,
                              color: color_textColorSecondary),
                          border: InputBorder.none,
                          filled: false,
                        ),
                        onFieldSubmitted: (term) {
                          controller.search();
                        }),
                  ),
                  InkWell(
                    onTap: () {
                      controller.clearSearch();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.cancel,
                        color: color_colorPrimary,
                        size: 20,
                      ),
                    ),
                  ).visible(controller.searchText.isNotEmpty),
                  InkWell(
                    onTap: () {
                      controller.search();
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        "images/search_broken.svg",
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text("Resultado da busca: ${controller.searchText}",
                          fontSize: textSizeSmall,
                          fontFamily: fontBold,
                          textColor: color_textColorPrimary)
                      .paddingOnly(
                          left: spacing_standard_new,
                          right: spacing_standard_new,
                          top: spacing_standard_new,
                          bottom: 12),
                  (controller.isLoading == true)
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : controller.searchResults.length > 0
                          ? ListView(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              children: controller.searchResults
                                  .map((element) => ListTile(
                                        onTap: () {
                                          Modular.to.pushNamed(
                                              '/marketplace/view',
                                              arguments: element,
                                              forRoot: (IO.Platform.isAndroid ||
                                                      IO.Platform.isIOS)
                                                  ? true
                                                  : false);
                                        },
                                        minVerticalPadding: 20,
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 5.0),
                                        leading: AspectRatio(
                                          aspectRatio: 1,
                                          child: Container(
                                            width: 50,
                                            height: 160,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                    element.productSellPhotos!
                                                        .first.imgPath
                                                        .toString()
                                                        .replaceFirst(
                                                            '.pdf', '.jpg'),
                                                  ),
                                                )),
                                          ),
                                        ),
                                        title: text(element.title.toString(),
                                            fontSize: 14.0, maxLine: 10),
                                        subtitle: text(
                                            element.producerUser!.fantasyName
                                                .toString(),
                                            fontSize: 12.0),
                                        trailing: text(
                                            "R\$ ${element.price.toString()}",
                                            fontSize: 12.0),
                                      ))
                                  .toList(),
                            )
                          : Container(),
                  // : Container(
                  //     child: GridView.builder(
                  //       itemCount: controller.searchResults.length,
                  //       shrinkWrap: true,
                  //       padding: EdgeInsets.only(left: 12, right: 12),
                  //       physics: BouncingScrollPhysics(),
                  //       gridDelegate:
                  //           SliverGridDelegateWithFixedCrossAxisCount(
                  //               crossAxisCount: 2, childAspectRatio: 9 / 13),
                  //       scrollDirection: Axis.vertical,
                  //       controller: ScrollController(keepScrollOffset: false),
                  //       itemBuilder: (context, index) {
                  //         return InkWell(
                  //           onTap: () {
                  //             Modular.to.pushNamed(
                  //                 'ebook/view/${controller.searchResults[index].id}',
                  //                 arguments: controller.searchResults[index],
                  //                 forRoot: (IO.Platform.isAndroid || IO.Platform.isIOS) ? true : false);
                  //           },
                  //           child: Card(
                  //             semanticContainer: true,
                  //             clipBehavior: Clip.antiAliasWithSaveLayer,
                  //             elevation: spacing_control_half,
                  //             margin: EdgeInsets.all(0),
                  //             shape: RoundedRectangleBorder(
                  //                 borderRadius:
                  //                     BorderRadius.circular(spacing_control)),
                  //             child: CachedNetworkImage(
                  //               imageUrl: controller.searchResults[index].file
                  //                   .toString()
                  //                   .replaceFirst('.pdf', '.jpg'),
                  //               width: 150,
                  //               height: double.infinity,
                  //               fit: BoxFit.fitHeight,
                  //             ),
                  //           ),
                  //         ).paddingAll(spacing_control);
                  //       },
                  //     ),
                  //   ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
