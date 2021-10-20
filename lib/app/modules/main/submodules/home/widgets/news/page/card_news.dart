import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/news/models/news.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:universal_io/io.dart' as IO;

class CardNewsWidget extends StatelessWidget {
  final NewsModel newsModel;
  final bool horizontal;
  final Function()? callback;

  CardNewsWidget({
    Key? key,
    required this.newsModel,
    this.horizontal = true,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Container(
        margin: EdgeInsets.only(
            left: width >= 1024 ? 0 : 13, right: 1, bottom: 24, top: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: white,
          image: DecorationImage(
            image: NetworkImage(newsModel.urlToImage.toString()),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 0,
              blurRadius: 5,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        height: !horizontal
            ? width > 500
                ? sy(120)
                : 150
            : sy(200),
        width: width > 500 ? sx(100) : sx(width),
        child: InkWell(
          onTap: () async {
            await Modular.to.pushNamed("/home/news/view/${newsModel.hashCode}",
                arguments: newsModel,
                forRoot: (IO.Platform.isAndroid || IO.Platform.isIOS)
                    ? true
                    : false);
            if (callback != null) callback!();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.1, 0.7],
                  colors: [Colors.black.withOpacity(0.8), Colors.transparent]),
            ),
            child: Align(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  newsModel.title.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              alignment: Alignment.bottomCenter,
            ),
          ),
        ),
      );
    });
  }
}
