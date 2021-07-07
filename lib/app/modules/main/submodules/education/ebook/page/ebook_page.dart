import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/widgets/widgets.dart';
import './ebook_page_store.dart';
import './../models/ebook_model.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class EbookPage extends StatefulWidget {
  const EbookPage({Key? key}) : super(key: key);

  @override
  _EbookPageState createState() => _EbookPageState();
}

class _EbookPageState extends ModularState<EbookPage, EbookPageStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text("Ebooks"),
        backgroundColor: color_colorPrimary,
      ),
      body: Observer(
        builder: (_) {
          if (controller.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (controller.ebooks != null) {
            List<Ebook> ebooks = controller.ebooks!;

            return ListView.builder(
              itemBuilder: (ctx, index) {
                Ebook ebook = ebooks[index];

                return ListTile(
                  title: Text(ebook.name!),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(ebook.category!.description!),
                      Text(ebook.author!)
                    ],
                  ),
                  onTap: () async {
                    Modular.to.pushNamed('view/${ebook.id}',
                        arguments: ebook, forRoot: true);
                  },
                );
              },
              itemCount: ebooks.length,
            );
          }

          return Center(
            child: Text("nenhum resultado"),
          );
        },
      ),
    );
  }
}