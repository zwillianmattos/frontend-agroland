import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/news/models/news.dart';
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
              pinned: false,
              title: innerBoxIsScrolled ? Text(widget.news!.title!) : null,
              backgroundColor: color_colorPrimary,
              expandedHeight: 250.0,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.news!.urlToImage!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [
                        0.1,
                        0.3
                      ],
                          colors: [
                        color_app_background.withOpacity(1),
                        Colors.transparent,
                      ])),
                ),
              ),
            ),
          ];
        },
        body: Container(
          // color: color_app_background,
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
