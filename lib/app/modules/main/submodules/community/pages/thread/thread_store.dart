import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:agro_tools/app/core/models/models/paginate_model.dart';
import 'package:agro_tools/app/core/utils/user_preferences_store.dart';
import 'package:agro_tools/app/modules/main/submodules/community/models/replies_model.dart';
import 'package:agro_tools/app/modules/main/submodules/community/models/thread_likes_model.dart';
import 'package:agro_tools/app/modules/main/submodules/community/models/thread_model.dart';
import 'package:agro_tools/app/modules/main/submodules/community/repositories/thread_repository.dart';
part 'thread_store.g.dart';

class ThreadStorePage = ThreadStorePageBase with _$ThreadStorePage;

abstract class ThreadStorePageBase with Store {
  final ThreadRepository repository;

  @observable
  bool isLoading = false;

  @observable
  int currentPage = 0;

  @observable
  int totalPage = 0;

  @observable
  ObservableList<Thread> threads = <Thread>[].asObservable();

  @observable
  ScrollController? threadScrollController;

  @observable
  PaginateModel paginateModel = new PaginateModel();

  @observable
  int? commentIndex;

  ThreadStorePageBase(this.repository) {
    threadScrollController = new ScrollController()
      ..addListener(_scrollListener);
    init();
  }

  @action
  void _scrollListener() {
    if (threadScrollController!.position.extentAfter < 120 &&
        isLoading == false) {
      // Request next Page
      if (currentPage < paginateModel.totalPages!) {
        currentPage++;
        loadThreads();
      }
    }
  }

  init() async {
    isLoading = true;
    await loadThreads();
    isLoading = false;
  }

  @action
  refresh() async {
    isLoading = true;
    currentPage = 0;
    totalPage = 0;
    threads = <Thread>[].asObservable();
    await loadThreads();
    isLoading = false;
  }

  @action
  loadThreads({
    query: "?size=10",
  }) async {
    paginateModel = await this.repository.load(
          query: "?size=10&page=$currentPage",
        );
    if (paginateModel.items is List<Thread>) {
      var data = paginateModel.items;
      threads.addAll(data as List<Thread>);
    }
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

  @action
  Future<void> like({
    required Thread thread,
  }) async {
    await repository.like(thread: thread);
    await refresh();
  }

  @action
  removeThread(Thread thread) async {

    await refresh();
  }
}
