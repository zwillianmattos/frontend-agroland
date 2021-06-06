import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plant_care/app/modules/main/submodules/community/models/replies_model.dart';
import 'package:plant_care/app/modules/main/submodules/community/models/thread_model.dart';
import 'package:plant_care/app/modules/main/submodules/community/repositories/thread_repository.dart';
part 'thread_store.g.dart';

class ThreadStorePage = ThreadStorePageBase with _$ThreadStorePage;

abstract class ThreadStorePageBase with Store {
  final ThreadRepository repository;

  @observable
  bool isLoading = false;

  @observable
  ObservableList<Thread>? threads;

  @observable
  int? commentIndex;

  ThreadStorePageBase(this.repository) {
    init();
  }

  init() async {
    isLoading = true;
    await loadThreads();
    isLoading = false;
  }

  @action
  loadThreads() async {
    List<Thread>? list = await this.repository.load();
    threads = list!.asObservable();
  }

  @action
  startCommentThread(index) {
    if (index != commentIndex)
      commentIndex = index;
    else
      commentIndex = null;
  }

  @action
  sendCommentThread({required String comment, required Thread thread}) async {
    await repository.send(
        replie: new Replies(
          body: comment,
        ),
        thread: thread);
    commentIndex = null;
  }
}
