import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plant_care/app/core/models/models/paginate_model.dart';
import 'package:plant_care/app/modules/main/submodules/community/models/replies_model.dart';
import 'package:plant_care/app/modules/main/submodules/community/models/thread_model.dart';
import 'package:plant_care/app/modules/main/submodules/community/repositories/thread_repository.dart';
part 'thread_store.g.dart';

class ThreadStorePage = ThreadStorePageBase with _$ThreadStorePage;

abstract class ThreadStorePageBase with Store {
  final ThreadRepository repository;

  @observable
  bool isLoading = false;

  int currentPage = 0;
  int totalPage = 0;

  @observable
  ObservableList<Thread> threads = <Thread>[].asObservable();

  @observable
  ScrollController? threadScrollController;

  late PaginateModel paginateModel;

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
}
