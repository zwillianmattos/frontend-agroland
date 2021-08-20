import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:fluttericon/typicons_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/core/utils/user_preferences_store.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:plant_care/app/modules/main/submodules/community/models/replies_model.dart';

import 'thread_view_store.dart';

class ThreadViewPage extends StatefulWidget {
  const ThreadViewPage({Key? key}) : super(key: key);

  @override
  _ThreadViewPageState createState() => _ThreadViewPageState();
}

class _ThreadViewPageState
    extends ModularState<ThreadViewPage, ThreadViewStorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: color_colorPrimary,
        title: Observer(builder: (_) {
          if (!controller.isLoading && controller.thread != null) {
            return Text(controller.thread!.title!);
          }

          return Text("-");
        }),
      ),
      body: Observer(
        builder: (_) {
          if (controller.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (controller.thread == null)
            return RetryWidget(onRetry: controller.loadThreadDetail,);

          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color:  Theme.of(context).backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 0,
                        blurRadius: 5,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 16.0, top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // User Details
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(controller.thread!.user!.name.toString()),
                            Spacer(),
                            Spacer(),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            controller.thread!.createdAt.toString(),
                            style:
                                TextStyle(color: Colors.grey, fontSize: 11.0),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            // Posted Timestamp
                            Text(
                              controller.thread!.title.toString(),
                              textAlign: TextAlign.justify,
                            ),
                            Html(
                              data: controller.thread!.body,
                              shrinkWrap: true,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                      icon: Icon(Typicons.heart),
                                      onPressed: () {}),
                                  IconButton(
                                      color: controller.comment
                                          ? color_colorPrimary
                                          : black,
                                      icon: Icon(Typicons.comment),
                                      onPressed: controller.startComment)
                                ],
                              ),
                            ),

                            // quill.QuillToolbar.basic(
                            //     controller: controller.commentController),
                            if (controller.comment)
                              TextField(
                                  textInputAction: TextInputAction.send,
                                  style: TextStyle(
                                      fontSize: textSizeMedium,
                                      fontFamily: fontRegular),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(16, 22, 16, 22),
                                    hintText: "Escreve uma resposta",
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        color: color_textColorSecondary),
                                  ),
                                  readOnly: false,
                                  onSubmitted: (value) {
                                    controller.sendComment(
                                        comment: value,
                                        thread: controller.thread!);
                                  }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 16,
                ),
                // Comments
                if (controller.thread!.replies != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: controller.thread!.replies!
                          .map((Replies replie) => replie.body != null
                              ? Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, right: 16.0, bottom: 16.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Container(
                                          margin: const EdgeInsets.only(
                                            left: 0.0,
                                          ),
                                          child: Image.network(
                                            Modular.get<UserPreferencesStore>().getUser?.imgLogo ?? "",
                                            width: 30,
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                              left: 16.0,
                                              bottom: 4.0,
                                            ),
                                            padding: EdgeInsets.all(16.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                              color: Theme.of(context).backgroundColor,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Theme.of(context).shadowColor
                                                      .withOpacity(0.15),
                                                  spreadRadius: 0,
                                                  blurRadius: 5,
                                                  offset: Offset(0,
                                                      0), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                text("${replie.user?.name}"),
                                                Html(
                                                  style: {
                                                    "p": Style(
                                                        textAlign:
                                                            TextAlign.justify),
                                                  },
                                                  data: replie.body!.toString(),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  replie.createdAt.toString(),
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 11.0),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Container())
                          .toList(),
                    ),
                  ),
                SizedBox(
                  height: 42,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
