import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agro_tools/app/core/env/variables.dart';
import 'package:agro_tools/app/core/widgets/widgets.dart';
import 'package:agro_tools/app/modules/main/submodules/education/cultures/models/culture_content.dart';
import 'package:agro_tools/app/modules/main/submodules/education/cultures/models/cultures_categories_rels.dart';
import 'package:agro_tools/app/modules/main/submodules/education/cultures/page/culture_detail_view_store.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class CultureDetailViewPage extends StatefulWidget {
  const CultureDetailViewPage({Key? key}) : super(key: key);

  @override
  _CultureDetailViewPageState createState() => _CultureDetailViewPageState();
}

class _CultureDetailViewPageState
    extends ModularState<CultureDetailViewPage, CultureDetailViewStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          if (this.controller.isLoading || this.controller.content == null)
            return text("-");

          return text("${controller.content!.description}");
        }),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share(
                  '${controller.content!.description} - ${WEBSITEDOMAIN}#/${Modular.to.path}');
            },
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Observer(builder: (_) {
        if (this.controller.isLoading)
          return Center(
            child: CircularProgressIndicator(),
          );

        if (this.controller.content == null)
          return RetryWidget(
            onRetry: controller.loadCultureDetail,
          );

        return ListView(
          children: controller.content!.content!.entries.map((e) {
            return e.value['photos'] != null
                ? BannerCarousel(
                    height: 200,
                    activeColor: Colors.green,
                    disableColor: Colors.grey,
                    animation: true,
                    indicatorBottom: true,
                    customizedBanners: (e.value['photos'])
                        .map<Widget>(
                          (photo) => Container(
                            child: Image.network(photo, fit: BoxFit.contain),
                          ),
                        )
                        .toList(),
                  )
                : ExpansionTile(
                    title: Text("${e.value['title']}"),
                    children: [
                      Container(
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
                              offset:
                                  Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Html(
                          data: e.value['content'],
                          onLinkTap: (String? link, _, __, el) async {
                            if (link != null) {
                              await canLaunch(link)
                                  ? await launch(link)
                                  : throw 'Could not launch link $link';
                            }
                          },
                        ),
                      )
                    ],
                  );
          }).toList(),
        );
      }),
    );
  }
}
