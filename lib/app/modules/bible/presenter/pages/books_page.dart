import 'package:app_inside/app/modules/bible/domain/entities/book.dart';
import 'package:app_inside/app/modules/bible/domain/errors/erros.dart';
import 'package:app_inside/app/modules/bible/presenter/stores/books_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class BooksPage extends StatefulWidget {
  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends ModularState<BooksPage, BooksStore> {
  Widget _buildList(List<Book> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (ctx, i) {
        var data = list[i];
        return Container(
          padding: EdgeInsets.only(left: 5.0, right: 5.0),
          child: ListTile(
            title: Text(
              data.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            onTap: () {
              showCupertinoModalBottomSheet(
                expand: false,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => Material(
                    child: SafeArea(
                  top: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              list[i].name,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              "${list[i].chapters.length.toString()} Capitulos",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: list[i].chapters.length,
                          itemBuilder: (_, d) {
                            return ListTile(
                              title: Text(
                                "Capitulo ${(d + 1).toString()}",
                              ),
                              onTap: () {
                                Modular.to.pushNamed(
                                    'book/${list[i].abbrev}/$d',
                                    arguments: list[i]);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildError(Failure error) {
    if (error is EmptyList) {
      return Center(
        child: Text('Nothing has been found'),
      );
    } else if (error is ErrorBible) {
      return Center(
        child: Text('Bible error'),
      );
    } else {
      return Center(
        child: Text('Internal error'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Container(
            padding: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Text(
                      "Biblia",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     showCupertinoModalBottomSheet(
                  //       expand: false,
                  //       context: context,
                  //       backgroundColor: Colors.transparent,
                  //       builder: (context) => Material(
                  //           child: SafeArea(
                  //         top: false,
                  //         child: Column(
                  //           mainAxisSize: MainAxisSize.min,
                  //           children: <Widget>[
                  //             Container(
                  //               padding: EdgeInsets.all(16.0),
                  //               child: Column(
                  //                 children: [
                  //                   Text(
                  //                     "Versoes",
                  //                     style: TextStyle(
                  //                         fontSize: 24,
                  //                         fontWeight: FontWeight.bold,
                  //                         color: Colors.black),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             Expanded(
                  //               child: ListView.builder(
                  //                 itemCount: ['aa', 'nvi', 'acf'].length,
                  //                 itemBuilder: (_, d) {
                  //                   return ListTile(
                  //                     title: Text(
                  //                       ['aa', 'nvi', 'acf'][d].toString(),
                  //                     ),
                  //                     onTap: () {
                  //                       controller.bibleVersionStore
                  //                           .setBibleVersion(
                  //                               ['aa', 'nvi', 'acf'][d]);
                  //                       Navigator.pop(_);
                  //                     },
                  //                   );
                  //                 },
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       )),
                  //     );
                  //   },
                  //   child: Container(
                  //       padding: EdgeInsets.only(
                  //           left: 10.0, right: 10.0, top: 6.0, bottom: 6.0),
                  //       decoration: BoxDecoration(
                  //           color: Colors.grey,
                  //           borderRadius: BorderRadius.circular(12)),
                  //       child: ScopedBuilder(
                  //         store: controller.bibleVersionStore,
                  //         onState: (context, state) {
                  //           return Text(
                  //             controller.bibleVersionStore.bibleVersion.toString(),
                  //             // controller.bibleVersion.toUpperCase(),
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 fontWeight: FontWeight.bold,
                  //                 color: Colors.black),
                  //           );
                  //         },
                  //       )),
                  // ),
                ]),
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                    color: Colors.black)
              ],
            ),
          ),
          bottom: TabBar(
            labelColor: Colors.black,
            labelPadding: EdgeInsets.only(left: 0, right: 0),
            tabs: [
              Tab(text: "Antigo Testamento"),
              Tab(text: "Novo Testamento"),
            ],
          ),
        ),
        body: Container(
          // padding: EdgeInsets.only(top: 22.0),
          child: Column(
            children: [
              Expanded(
                child: ScopedBuilder<BooksStore, Failure, List<Book>>(
                    store: controller,
                    onLoading: (_) =>
                        Center(child: CircularProgressIndicator()),
                    onError: (_, error) {
                      return _buildError(error!);
                    },
                    onState: (_, state) {
                      if (state.isEmpty) {
                        return Center(
                          child: Text('Loading...'),
                        );
                      } else {
                        return TabBarView(children: [
                          _buildList(state.sublist(0, 39)),
                          _buildList(state.sublist(39, 66))
                        ]);
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
