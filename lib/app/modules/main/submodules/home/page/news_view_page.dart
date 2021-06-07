import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:plant_care/app/modules/main/submodules/home/models/news.dart';

class NewsViewPage extends StatefulWidget {
  final NewsModel? news;

  const NewsViewPage({Key? key, this.news}) : super(key: key);

  @override
  _NewsViewPageState createState() => _NewsViewPageState();
}

class _NewsViewPageState extends State<NewsViewPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text(widget.news!.title!),
          backgroundColor: Colors.green,
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            background:
                Image.network(widget.news!.urlToImage!, fit: BoxFit.cover),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(widget.news!.title!),
                    SizedBox(
                      height: 10,
                    ),
                    Text(widget.news!.author!),
                    Text(widget.news!.publishedAt!.toIso8601String()),
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
                      onPressed: () {},
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
      ],
    );
    ;
  }
}
