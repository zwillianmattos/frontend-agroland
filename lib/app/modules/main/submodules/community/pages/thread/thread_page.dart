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
import 'package:agro_tools/app/modules/main/submodules/community/models/thread_likes_model.dart';
import 'package:agro_tools/app/modules/main/submodules/community/models/thread_model.dart';
import 'package:agro_tools/app/modules/main/submodules/community/pages/thread/thread_store.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:universal_io/io.dart' as IO;

class ThreadPage extends StatefulWidget {
  @override
  _ThreadPageState createState() => _ThreadPageState();
}

class _ThreadPageState extends ModularState<ThreadPage, ThreadStorePage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: text("Comunidade"),
        backgroundColor: Colors.transparent,
      ),
      body: Observer(
        builder: (_) {
          if (controller.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Thread> list = controller.threads;

          return RelativeBuilder(builder: (context, height, width, sy, sx) {
            return Container(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        await controller.refresh();
                      },
                      child: Container(
                        // width: width > 600 ? sx(300) : width,
                        child: ListView.builder(
                          controller: controller.threadScrollController,
                          physics: BouncingScrollPhysics(),
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int index) {
                            Widget? content;
                            try {
                              var myJSON = jsonDecode(list[index].body!);
                              var controller = QuillController(
                                  document:
                                      Document.fromJson(jsonDecode(myJSON)),
                                  selection: TextSelection(
                                    baseOffset: 0,
                                    extentOffset: 0,
                                  ));
                              content = QuillEditor(
                                autoFocus: false,
                                readOnly: true,
                                showCursor: false,
                                controller: controller,
                                expands: false,
                                padding: EdgeInsets.all(8.0),
                                focusNode: new FocusNode(),
                                scrollable: false,
                                scrollController: new ScrollController(),
                              );
                            } on Exception catch (e) {
                              print(e);
                              content = Html(
                                data: list[index].body,
                                shrinkWrap: true,
                              );
                            }

                            return InkWell(
                              onTap: () {
                                Modular.to.pushNamed(
                                    "view/${list[index].channel!.id}/${list[index].id}",
                                    forRoot: (IO.Platform.isAndroid ||
                                            IO.Platform.isIOS)
                                        ? true
                                        : false);
                              },
                              onLongPress: () {
                                User? user =
                                    Modular.get<UserPreferencesStore>().getUser;

                                if (user != null &&
                                    list[index].user?.id == user.id)
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            ListTile(
                                              leading:
                                                  new Icon(Icons.remove_circle),
                                              title: new Text('Remover'),
                                              onTap: () {
                                                controller
                                                    .removeThread(list[index]);
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
                                margin: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  color: Theme.of(context).backgroundColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.15),
                                      spreadRadius: 0,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 0), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      // User Details
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            child: Card(
                                              semanticContainer: true,
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Image.network(
                                                "${list[index].user?.imgLogo}",
                                                width: 30,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(list[index]
                                                  .user!
                                                  .name
                                                  .toString()),
                                              Text(
                                                list[index]
                                                    .createdAt
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 11.0),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Spacer(),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          content,
                                          // butttons
                                          Observer(builder: (_) {
                                            User? user = Modular.get<
                                                    UserPreferencesStore>()
                                                .getUser;
                                            bool liked = false;

                                            if (user != null) {
                                              var result = list[index]
                                                  .threadLikes
                                                  ?.where((element) =>
                                                      element.user?.id ==
                                                      user.id);

                                              if (result?.length != null &&
                                                  result!.length > 0) {
                                                liked = true;
                                              } else {
                                                liked = false;
                                              }
                                            }

                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 1.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      IconButton(
                                                          iconSize: 20,
                                                          color: black,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(2.0),
                                                          icon: Icon(liked
                                                              ? Typicons
                                                                  .heart_filled
                                                              : Typicons.heart),
                                                          onPressed: () async {
                                                            await controller
                                                                .like(
                                                                    thread: list[
                                                                        index]);
                                                          }),
                                                      text(
                                                          "${list[index].threadLikes?.length ?? 0}"),
                                                    ],
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      IconButton(
                                                          iconSize: 20,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(2.0),
                                                          color: black,
                                                          icon: Icon(
                                                              Typicons.comment),
                                                          onPressed: null),
                                                      text(
                                                          "${list[index].replies?.length}"),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            );
                                          }),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Modular.to.pushNamed('/community/newPost',
              forRoot:
                  (IO.Platform.isAndroid || IO.Platform.isIOS) ? true : false);
          await controller.refresh();
        },
        child: Icon(Icons.post_add),
      ),
    );
  }
}
