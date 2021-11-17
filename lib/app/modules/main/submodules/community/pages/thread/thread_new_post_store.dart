import 'dart:convert';
import 'package:agro_tools/app/modules/main/submodules/community/models/thread_model.dart';
import 'package:agro_tools/app/modules/main/submodules/community/repositories/thread_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:mobx/mobx.dart';

import 'dart:async';
import 'package:universal_io/io.dart';
part 'thread_new_post_store.g.dart';

class ThreadNewPostStore = ThreadNewPostStoreBase with _$ThreadNewPostStore;

abstract class ThreadNewPostStoreBase with Store {
  final ThreadRepository _repository;
  
  TextEditingController? textEditingController;

  final FocusNode focusNode = FocusNode();

  bool isLoading = false;

  ThreadNewPostStoreBase(this._repository) {
    loadFromAssets();
  }


  @action
  Future<void> loadFromAssets() async {
    isLoading = true;
    final doc = Document()..insert(0, '');
    textEditingController = new TextEditingController();
    isLoading = false;
  }

  @action
  bool isDesktop() => !kIsWeb && !Platform.isAndroid && !Platform.isIOS;


  @action
  Future<void> sendComment() async {
    Thread? thread;
    try {
      isLoading = true;
      var json = jsonEncode(textEditingController?.text);
      thread = await this._repository.store(thread: Thread(body: json));
    } catch (e) {
      print(e);
      isLoading = false;
    } finally {
      isLoading = false;

    }
  }
}
