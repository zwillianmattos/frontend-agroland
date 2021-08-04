import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/env/variables.dart';
import 'package:plant_care/app/modules/main/submodules/education/cultures/models/culture_content.dart';
import 'package:plant_care/app/modules/main/submodules/education/cultures/models/cultures_categories_rels.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class CultureDetailViewPage extends StatefulWidget {
  const CultureDetailViewPage({Key? key}) : super(key: key);

  @override
  _CultureDetailViewPageState createState() => _CultureDetailViewPageState();
}

class _CultureDetailViewPageState extends State<CultureDetailViewPage> {
  late final CultureContent cultureContent;

  late Map<String, dynamic>? content;

  @override
  void initState() {
    // TODO: implement initState
    cultureContent = Modular.args?.data as CultureContent;
    content = cultureContent.content;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("${cultureContent.description}"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                Share.share(
                    '${cultureContent.description} - ${WEBSITEDOMAIN}${Modular.to.path}');
              },
            ),
          ]),
      body: ListView(
        children: content!.entries.map((e) {
          
          return e.value['photos'] != null
              ? BannerCarousel(
                  height: 200,
                  activeColor: Colors.green,
                  disableColor: Colors.grey,
                  animation: true,
                  indicatorBottom: true,
                  customizedBanners: (e.value['photos']).map<Widget>(
                        (photo) => Container(
                          child: Image.network(photo, fit: BoxFit.contain),
                        ),
                      )
                      .toList(),
                )
              : ExpansionTile(
                  title: Text("${e.value['title']}"),
                  children: [
                    ListTile(
                      title: Html(
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
      ),
    );
  }
}
