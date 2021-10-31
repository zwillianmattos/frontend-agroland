import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:agro_tools/app/core/widgets/widgets.dart';
import 'package:relative_scale/relative_scale.dart';
import '../models/news.dart';
import './news_store.dart';
import 'package:universal_io/io.dart' as IO;

import 'card_news.dart';

class NewsWidget extends StatefulWidget {
  final bool horizontal;
  final Function()? callback;
  const NewsWidget({Key? key, this.horizontal = true, this.callback}) : super(key: key);

  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends ModularState<NewsWidget, NewsStore> {
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return SizedBox(
        height: width > 500 ? sy(120) : 200,
        width: width >= 1024 ? 1024 : width,
        child: Observer(builder: (context) {
          if (controller.isLoading)
            return Center(
              child: CircularProgressIndicator(),
            );

          if (controller.newsList == null)
            return RetryWidget(
              onRetry: controller.loadNews,
            );

          return ListView.builder(
              scrollDirection:
                  widget.horizontal ? Axis.horizontal : Axis.vertical,
              itemCount: controller.newsList!.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                NewsModel item = controller.newsList![index];

                return CardNewsWidget(
                    newsModel: item, horizontal: widget.horizontal, callback: widget.callback,);
              });
        }),
      );
    });
  }
}
