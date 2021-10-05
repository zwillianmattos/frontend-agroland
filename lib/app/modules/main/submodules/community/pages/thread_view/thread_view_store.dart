import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:mobx/mobx.dart';
import 'package:plant_care/app/modules/main/submodules/community/models/replies_model.dart';
import 'package:plant_care/app/modules/main/submodules/community/models/thread_model.dart';
import 'package:plant_care/app/modules/main/submodules/community/repositories/thread_repository.dart';

part 'thread_view_store.g.dart';

class ThreadViewStorePage = ThreadViewStorePageBase with _$ThreadViewStorePage;

abstract class ThreadViewStorePageBase with Store {
  final ThreadRepository repository;

  @observable
  bool isLoading = false;

  @observable
  Thread? thread;

  @observable
  bool comment = false;

  @observable
  QuillController commentController = QuillController.basic();

  ThreadViewStorePageBase(this.repository) {
    loadThreadDetail();
  }

  @action
  loadThreadDetail() async {
    isLoading = true;
    var param = Modular.args!.params;
    thread = await this
        .repository
        .find(channel: param['channel'], threadId: param['thread']);
    print(param);
    isLoading = false;
  }

  @action
  startComment() => comment = !comment;

  @action
  sendComment({required String comment, required Thread thread}) async {
    await repository.send(
        replie: new Replies(
          body: comment,
        ),
        thread: thread);
    return await loadThreadDetail();
  }

  @action
  removeComment(String replieId) async {
    try {
      var param = Modular.args!.params;
      await repository.delete(
          channelId: param['channel'],
          threadId: param['thread'],
          replieId: replieId);

      EasyLoading.showSuccess("Comentário excluído");
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
    return await loadThreadDetail();
  }

  @action
  Future<void> like({
    required Thread thread,
  }) async {
    await repository.like(thread: thread);
    await loadThreadDetail();
  }
}
