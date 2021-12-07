import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:agro_tools/app/core/utils/user_preferences_store.dart';
import 'package:agro_tools/app/core/widgets/widgets.dart';
import 'package:agro_tools/app/modules/main/submodules/community/pages/thread/thread_new_post_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tuple/tuple.dart';
import 'package:filesystem_picker/filesystem_picker.dart';
import 'package:path/path.dart';

class ThreadNewPostPage extends StatefulWidget {
  const ThreadNewPostPage({Key? key}) : super(key: key);

  @override
  _ThreadNewPostPageState createState() => _ThreadNewPostPageState();
}

class _ThreadNewPostPageState
    extends ModularState<ThreadNewPostPage, ThreadNewPostStore> {
  @override
  Widget build(BuildContext context) {
    if (controller.quillController == null) {
      return const Scaffold(body: Center(child: Text('Loading...')));
    }

    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          title: text(
            'Nova publicação',
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  await controller.sendComment();
                },
                icon: Icon(Icons.save))
          ],
        ),
        body: Observer(builder: (_) {
          return controller.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : RawKeyboardListener(
                  focusNode: FocusNode(),
                  onKey: (event) {
                    if (event.data.isControlPressed && event.character == 'b') {
                      if (controller.quillController!
                          .getSelectionStyle()
                          .attributes
                          .keys
                          .contains('bold')) {
                        controller.quillController!.formatSelection(
                            Attribute.clone(Attribute.bold, null));
                      } else {
                        controller.quillController!
                            .formatSelection(Attribute.bold);
                      }
                    }
                  },
                  child: _buildWelcomeEditor(context),
                );
        }),
      );
    });
  }

  Widget _buildWelcomeEditor(BuildContext context) {
    var quillEditor = QuillEditor(
        controller: controller.quillController!,
        scrollController: ScrollController(),
        scrollable: true,
        focusNode: controller.focusNode,
        autoFocus: false,
        readOnly: false,
        placeholder: 'Escreva...',
        expands: false,
        padding: EdgeInsets.zero,
        customStyles: DefaultStyles(
          h1: DefaultTextBlockStyle(
              const TextStyle(
                fontSize: 32,
                color: Colors.black,
                height: 1.15,
                fontWeight: FontWeight.w300,
              ),
              const Tuple2(16, 0),
              const Tuple2(0, 0),
              null),
          sizeSmall: const TextStyle(fontSize: 9),
        ));
    if (kIsWeb) {
      quillEditor = QuillEditor(
        controller: controller.quillController!,
        scrollController: ScrollController(),
        scrollable: true,
        focusNode: controller.focusNode,
        autoFocus: false,
        readOnly: false,
        placeholder: 'Escreva...',
        expands: false,
        padding: EdgeInsets.zero,
        customStyles: DefaultStyles(
          h1: DefaultTextBlockStyle(
              const TextStyle(
                fontSize: 32,
                color: Colors.black,
                height: 1.15,
                fontWeight: FontWeight.w300,
              ),
              const Tuple2(16, 0),
              const Tuple2(0, 0),
              null),
          sizeSmall: const TextStyle(fontSize: 9),
        ),
      );
    }
    var toolbar = QuillToolbar.basic(
      controller: controller.quillController!,
      toolbarIconSize: 32,
      showCameraButton: false,
      showIndent: false,
      showHistory: false,
      showBoldButton: false,
      showHeaderStyle: false,
      showListNumbers: false,
      showQuote: false,
      showItalicButton: false,
      showCodeBlock: false,
      showUnderLineButton: false,
      showListCheck: false,
      showListBullets: false,
      showLink: false,
      showStrikeThrough: false,
      showClearFormat: false,
      showColorButton: false,
      showBackgroundColorButton: false,
      // provide a callback to enable picking images from device.
      // if omit, "image" button only allows adding images from url.
      // same goes for videos.
      onImagePickCallback: controller.onImagePickCallback,
      onVideoPickCallback: controller.onVideoPickCallback,
      // uncomment to provide a custom "pick from" dialog.
      mediaPickSettingSelector: _selectMediaPickSetting,
    );
    if (kIsWeb) {
      toolbar = QuillToolbar.basic(
        controller: controller.quillController!,
        onImagePickCallback: controller.onImagePickCallback,
        webImagePickImpl: controller.webImagePickImpl,
      );
    }
    if (controller.isDesktop()) {
      toolbar = QuillToolbar.basic(
        controller: controller.quillController!,
        onImagePickCallback: controller.onImagePickCallback,
        filePickImpl: controller.openFileSystemPickerForDesktop,
      );
    }

    var result = SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 15,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: quillEditor,
            ),
          ),
          kIsWeb
              ? Expanded(
                  child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: toolbar,
                ))
              : Container(child: toolbar)
        ],
      ),
    );

    if (Modular.get<UserPreferencesStore>().darkTheme) {
      return Theme(data: ThemeData.dark(), child: result);
    }
    return Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.black),
        ),
        child: result);
  }

  Future<MediaPickSetting?> _selectMediaPickSetting(BuildContext context) =>
      showDialog<MediaPickSetting>(
        context: context,
        builder: (ctx) => Theme(
          data: Theme.of(context),
          child: AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton.icon(
                  icon: const Icon(Icons.collections),
                  label: const Text('Galeria'),
                  onPressed: () => Navigator.pop(ctx, MediaPickSetting.Gallery),
                ),
                TextButton.icon(
                  icon: const Icon(Icons.link),
                  label: const Text('Link'),
                  onPressed: () => Navigator.pop(ctx, MediaPickSetting.Link),
                )
              ],
            ),
          ),
        ),
      );
}
