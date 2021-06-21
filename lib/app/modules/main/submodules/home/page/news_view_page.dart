import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/modules/main/submodules/home/models/news.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsViewPage extends StatefulWidget {
  final NewsModel? news;

  const NewsViewPage({Key? key, this.news}) : super(key: key);

  @override
  _NewsViewPageState createState() => _NewsViewPageState();
}

class _NewsViewPageState extends State<NewsViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: NestedScrollView(
            
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              title: innerBoxIsScrolled ?  Text(widget.news!.title!) : null,
              backgroundColor: color_colorPrimary,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                background:
                    Image.network(widget.news!.urlToImage!, fit: BoxFit.cover),
              ),
            ),
          ];
        },
        body: Container(
          color: color_app_background,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.news!.title!,
                      style: TextStyle(
                          fontFamily: fontBold,
                          fontSize: textSizeNormal,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(widget.news?.author ?? "-"),
                    Text(widget.news?.publishedAt?.toIso8601String() ?? "-"),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  widget.news!.content!,
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(Typicons.forward_outline),
                      onPressed: () async {},
                    ),
                    IconButton(
                      icon: Icon(Typicons.heart),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
