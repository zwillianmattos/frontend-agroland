import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agro_tools/app/core/consts/colors.dart';
import 'package:agro_tools/app/core/widgets/widgets.dart';
import './ebook_page_store.dart';
import './../models/ebook_model.dart';
import 'package:universal_io/io.dart' as IO;

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
        title: text("Livros"),
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
                    await Modular.to.pushNamed('view/${ebook.id}',
                        arguments: ebook,
                        forRoot: (IO.Platform.isAndroid || IO.Platform.isIOS)
                            ? true
                            : false);
                    await controller.loadEbooks();
                  },
                );
              },
              itemCount: ebooks.length,
            );
          }

          return Center(
            child: Text("Nenhum resultado"),
          );
        },
      ),
    );
  }
}
