import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/modules/main/submodules/community/models/replies_model.dart';
import 'package:plant_care/app/modules/main/submodules/community/models/thread_model.dart';
import 'package:plant_care/app/modules/main/submodules/community/pages/thread/thread_store.dart';
import 'package:plant_care/app/widgets/widgets.dart';
import 'package:relative_scale/relative_scale.dart';

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
        title: text("Comunidade"),
        backgroundColor: color_colorPrimary,
      ),
      body: Observer(
        builder: (_) {
          if (controller.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Thread> list = controller.threads!;

          return RelativeBuilder(builder: (context, height, width, sy, sx) {
            print(width);
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: color_white,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 8,
                        bottom: 8,
                      ),
                      child: Column(
                        children: [
                          // Column(
                          //   children: [
                          //     Container(
                          //       decoration: BoxDecoration(
                          //         borderRadius:
                          //             BorderRadius.all(Radius.circular(6)),
                          //         color: white,
                          //         boxShadow: [
                          //           BoxShadow(
                          //             color: Colors.grey.withOpacity(0.06),
                          //             spreadRadius: 5,
                          //             blurRadius: 10,
                          //             offset: Offset(
                          //                 0, 0), // changes position of shadow
                          //           ),
                          //         ],
                          //       ),
                          //       child: TextField(
                          //           textAlignVertical: TextAlignVertical.center,
                          //           decoration: InputDecoration(
                          //             fillColor: color_white,
                          //             hintText: "Buscar",
                          //             border: InputBorder.none,
                          //             prefixIcon: Icon(Typicons.search_outline),
                          //             contentPadding: EdgeInsets.only(
                          //                 left: 26.0,
                          //                 bottom: 8.0,
                          //                 top: 8.0,
                          //                 right: 50.0),
                          //           )),
                          //       alignment: Alignment.center,
                          //     ),
                          //   ],
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 0.0,
                                ),
                                child: Image.network(
                                  "https://conder.sc.gov.br/wp-content/uploads/2019/08/avatar.png",
                                  width: 30,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(8),
                                  decoration: boxDecoration(
                                      bgColor: color_edit_background,
                                      color: color_edit_background,
                                      showShadow: false,
                                      radius: 4),
                                  child: TextField(
                                      textInputAction: TextInputAction.send,
                                      style: TextStyle(
                                          fontSize: textSizeMedium,
                                          fontFamily: fontRegular),
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.fromLTRB(16, 22, 16, 22),
                                        hintText: "O que vc esta pensando?",
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                            color: color_textColorSecondary),
                                      ),
                                      readOnly: false,
                                      onSubmitted: (value) {}),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        await controller.loadThreads();
                      },
                      child: Container(
                        width: width > 600 ? sx(300) : width,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Modular.to.pushNamed(
                                    "view/${list[index].channel!.id}/${list[index].id}");
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: 16.0,
                                    right: 16.0,
                                    bottom: 8.0,
                                    top: 8.0),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3)),
                                  color: white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.15),
                                      spreadRadius: 2,
                                      blurRadius: 19,
                                      offset: Offset(
                                          4, 6), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0,
                                      right: 16.0,
                                      bottom: 8.0,
                                      top: 8.0),
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
                                            padding: const EdgeInsets.only(
                                                left: 4.0,
                                                top: 16.0,
                                                right: 8.0,
                                                bottom: 16.0),
                                            child: Image.network(
                                              "https://conder.sc.gov.br/wp-content/uploads/2019/08/avatar.png",
                                              width: 30,
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
                                          // IconButton(
                                          //   icon: Icon(Icons.more_vert),
                                          //   onPressed: () {},
                                          //   iconSize: 20,
                                          // )
                                        ],
                                      ),

                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          // Posted Timestamp
                                          if (list[index].title != null)
                                            Text(
                                              list[index].title.toString(),
                                              textAlign: TextAlign.justify,
                                            ),
                                          Html(
                                            data: list[index].body,
                                            shrinkWrap: true,
                                          ),
                                          Divider(),
                                          // butttons
                                          Observer(builder: (_) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 1.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  IconButton(
                                                      iconSize: 20,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2.0),
                                                      icon:
                                                          Icon(Typicons.heart),
                                                      onPressed: () {}),
                                                  IconButton(
                                                      iconSize: 20,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2.0),
                                                      color: controller
                                                                  .commentIndex ==
                                                              index
                                                          ? color_colorPrimary
                                                          : black,
                                                      icon: Icon(
                                                          Typicons.comment),
                                                      onPressed: () {
                                                        controller
                                                            .startCommentThread(
                                                                index);
                                                      })
                                                ],
                                              ),
                                            );
                                          }),
                                          Observer(builder: (c) {
                                            if (controller.commentIndex !=
                                                    null &&
                                                controller.commentIndex ==
                                                    index)
                                              return TextField(
                                                  autofocus: true,
                                                  textInputAction:
                                                      TextInputAction.send,
                                                  style: TextStyle(
                                                      fontSize: textSizeMedium,
                                                      fontFamily: fontRegular),
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.fromLTRB(
                                                            16, 22, 16, 22),
                                                    hintText:
                                                        "Escreve uma resposta",
                                                    border: InputBorder.none,
                                                    hintStyle: TextStyle(
                                                        color:
                                                            color_textColorSecondary),
                                                  ),
                                                  readOnly: false,
                                                  onSubmitted: (value) {
                                                    controller
                                                        .sendCommentThread(
                                                            comment: value,
                                                            thread:
                                                                list[index]);
                                                  });
                                            return Container();
                                          })
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
    );
  }
}
