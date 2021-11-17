import 'package:agro_tools/app/core/utils/user_preferences_store.dart';
import 'package:agro_tools/app/core/widgets/widgets.dart';
import 'package:agro_tools/app/modules/main/submodules/community/pages/thread/thread_new_post_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:tuple/tuple.dart';

class ThreadNewPostPage extends StatefulWidget {
  const ThreadNewPostPage({Key? key}) : super(key: key);

  @override
  _ThreadNewPostPageState createState() => _ThreadNewPostPageState();
}

class _ThreadNewPostPageState
    extends ModularState<ThreadNewPostPage, ThreadNewPostStore> {
  @override
  Widget build(BuildContext context) {
    if (controller.textEditingController == null) {
      return const Scaffold(body: Center(child: Text('Loading...')));
    }

    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          title: text(
            'Nova publicacao',
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  await controller.sendComment();
                  Navigator.pop(context);
                },
                icon: Icon(Icons.save))
          ],
        ),
        body: Observer(builder: (_) {
          return controller.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : TextField(
                  controller: controller.textEditingController!,
                  focusNode: controller.focusNode,
                );
        }),
      );
    });
  }
}
