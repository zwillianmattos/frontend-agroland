import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:fluttericon/typicons_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:agro_tools/app/core/consts/colors.dart';
import 'package:agro_tools/app/core/consts/texts.dart';
import 'package:agro_tools/app/core/utils/user_preferences_store.dart';
import 'package:agro_tools/app/core/widgets/widgets.dart';
import 'package:agro_tools/app/modules/account/models/user.dart';
import 'package:agro_tools/app/modules/main/submodules/community/models/replies_model.dart';
import 'package:universal_io/io.dart' as IO;

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
        backgroundColor: Colors.transparent,
        title: text("Detalhes"),
      ),
      body: Observer(
        builder: (_) {
          if (controller.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (controller.thread == null)
            return RetryWidget(
              onRetry: controller.loadThreadDetail,
            );

          Widget? content;
          try {
            var myJSON = jsonDecode(controller.thread!.body!);

            var c = QuillController(
                document: Document.fromJson(jsonDecode(myJSON)),
                selection: TextSelection(
                  baseOffset: 0,
                  extentOffset: 0,
                ));
            content = QuillEditor(
              autoFocus: false,
              readOnly: true,
              showCursor: false,
              controller: c,
              expands: false,
              padding: EdgeInsets.all(8.0),
              focusNode: new FocusNode(),
              scrollable: false,
              scrollController: new ScrollController(),
            );
          } on FormatException catch (e) {
            content = Html(
              data:  controller.thread!.body,
              shrinkWrap: true,
            );
          }
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  decoration: BoxDecoration(
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
                            Container(
                              child: Card(
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Image.network(
                                  "${controller.thread!.user?.imgLogo}",
                                  width: 30,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(controller.thread!.user!.name.toString()),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Text(
                                    controller.thread!.createdAt.toString(),
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 11.0),
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            content,
                            Observer(builder: (_) {
                              User? user =
                                  Modular.get<UserPreferencesStore>().getUser;
                              bool liked = false;

                              if (user != null) {
                                var result = controller.thread?.threadLikes
                                    ?.where((element) =>
                                        element.user?.id == user.id);
                                if (result?.length != null &&
                                    result!.length > 0) {
                                  liked = true;
                                } else {
                                  liked = false;
                                }
                              }
                              return Padding(
                                padding: const EdgeInsets.only(top: 1.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        IconButton(
                                            iconSize: 20,
                                            color: black,
                                            padding: const EdgeInsets.all(2.0),
                                            icon: Icon(liked
                                                ? Typicons.heart_filled
                                                : Typicons.heart),
                                            onPressed: () async {
                                              await controller.like(
                                                  thread: controller.thread!);
                                            }),
                                        text(
                                            "${controller.thread!.threadLikes?.length ?? 0}"),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        IconButton(
                                            iconSize: 20,
                                            padding: const EdgeInsets.all(2.0),
                                            color: black,
                                            icon: Icon(Typicons.comment),
                                            onPressed: () {
                                              controller.startComment();
                                            }),
                                        text(
                                            "${controller.thread!.replies?.length}"),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            }),

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
                              ? InkWell(
                                  onLongPress: () {
                                    User? user =
                                        Modular.get<UserPreferencesStore>()
                                            .getUser;

                                    if (user != null &&
                                        replie.user?.id == user.id)
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                ListTile(
                                                  leading: new Icon(
                                                      Icons.remove_circle),
                                                  title: new Text('Remover'),
                                                  onTap: () {
                                                    controller.removeComment(
                                                        replie.id.toString());
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                ListTile(
                                                  leading: new Icon(Icons.edit),
                                                  title: new Text('Editar'),
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            );
                                          });
                                  },
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0,
                                          right: 16.0,
                                          bottom: 16.0),
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
                                            child: Card(
                                              semanticContainer: true,
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Image.network(
                                                "${replie.user?.imgLogo}",
                                                width: 30,
                                              ),
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
                                                color: Theme.of(context)
                                                    .backgroundColor,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
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
                                                  if (replie.user?.name != null)
                                                    text(
                                                      "${replie.user?.name ?? ""}",
                                                      fontSize: 14,
                                                    ),
                                                  Html(
                                                    style: {
                                                      "p": Style(
                                                          textAlign: TextAlign
                                                              .justify),
                                                    },
                                                    data:
                                                        replie.body!.toString(),
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
