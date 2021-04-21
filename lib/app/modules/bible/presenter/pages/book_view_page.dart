import 'package:app_inside/app/modules/bible/domain/entities/book.dart';
import 'package:app_inside/app/modules/bible/presenter/stores/book_view_store.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BookViewPage extends StatefulWidget {
  Book book;
  int chapeter;

  BookViewPage({required this.book, required this.chapeter});

  @override
  _BookViewPageState createState() => _BookViewPageState();
}

class ItemModel {
  String title;
  IconData icon;
  ItemModel(this.title, this.icon);
}

class _BookViewPageState extends ModularState<BookViewPage, BookViewStore> {
  Widget _buildList(List chapters) {
    List versicles = chapters[widget.chapeter];

    return ListView.builder(
      itemCount: versicles.length,
      itemBuilder: (ctx, i) {
        var data = versicles[i];

        return Observer(
          builder: (_) {
            return ListTile(
              selected: controller.getSelectedVersicles(i),
              onTap: () {
                controller.selectVersicle(i);
              },
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0, top: 5.0),
                    child: Text(
                      (i + 1).toString(),
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  Expanded(
                    child: controller.getSelectedVersicles(i)
                        ? Text.rich(
                            TextSpan(
                              text: data,
                              style: new TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontStyle: FontStyle.italic),
                            ),
                            textAlign: TextAlign.justify,
                          )
                        : Text(
                            data,
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              "${widget.book.name} - ${(widget.chapeter + 1).toString()}",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            actions: [
              IconButton(
                  icon: Icon(Icons.bookmark),
                  onPressed: () {},
                  color: Colors.black)
            ],
          ),
          body: _buildList(widget.book.chapters),
        ),
      ],
    );
  }
}
