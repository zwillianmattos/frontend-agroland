import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plant_care/app/core/models/models/paginate_model.dart';
import 'package:plant_care/app/core/utils/user_preferences_store.dart';
import 'package:plant_care/app/modules/main/submodules/community/models/replies_model.dart';
import '../models/thread_model.dart';

part 'thread_repository.g.dart';

abstract class ThreadDatasource {
  Future<PaginateModel> load();
  Future<List<dynamic>?> store();
  Future<List<dynamic>?> delete(
      {required String channelId,
      required String threadId,
      required String replieId});
}

@Injectable(singleton: false)
class ThreadRepository implements ThreadDatasource {
  final Dio dio;

  ThreadRepository(this.dio);

  @override
  Future<PaginateModel> load({query: ""}) async {
    List<Thread> lista = [];
    try {
      Response response = await dio.get(
        '/threads$query',
      );

      if (response.statusCode != 200) throw Error();

      var jsonResponse = response.data;

      List<dynamic> list = jsonResponse['data']['items'];

      if (list != null) {
        list.asMap().forEach((key, value) {
          lista.add(Thread.fromJson(value));
        });
      }

      return PaginateModel(
          currentPage: jsonResponse['data']['currentPage'],
          totalPages: jsonResponse['data']['totalPages'],
          totalItems: jsonResponse['data']['totalItems'],
          items: lista);
    } catch (e) {
      print("erro");
      print(e);
      return PaginateModel(
          currentPage: 0, totalPages: 0, totalItems: 0, items: []);
    }
  }

  find({required String channel, required String threadId}) async {
    Thread? thread;

    try {
      Response response = await dio.get(
        "threads/${channel}/${threadId}",
      );
      print(response.realUri);
      var jsonResponse = response.data;

      print(jsonResponse);

      List<dynamic> list = jsonResponse['data']['items'];
      if (list != null) {
        thread = Thread.fromJson(list.first);
      }
    } catch (e) {
      print(e);
    }

    return thread;
  }

  @override
  Future<List<dynamic>?> store() async {}

  @override
  Future<List<dynamic>?> delete(
      {required String channelId,
      required String threadId,
      required String replieId}) async {
    Response response = await dio.delete(
      "threads/$channelId/$threadId/$replieId",
      options: await Modular.get<UserPreferencesStore>().authHeader,
    );
    var jsonResponse = response.data;
    if (jsonResponse['status'] != true) throw (jsonResponse['message']);
  }

  @override
  Future<Replies?> send({
    required Replies replie,
    required Thread thread,
  }) async {
    Replies? replieData;

    try {
      Response response = await dio.post(
          "threads/${thread.channel}/${thread.id}/replies",
          options: await Modular.get<UserPreferencesStore>().authHeader,
          data: {
            'body': replie.body,
          });
      print("threads/${thread.channel}/${thread.id}/replies");
      var jsonResponse = response.data;
      replieData = Replies.fromJson(jsonResponse['replie']);
    } catch (e) {
      print(e);
    }

    return replieData;
  }

  Future<bool> like({
    required Thread thread,
  }) async {
    try {
      print("${Modular.get<UserPreferencesStore>().authHeader}");

      print(
          "${dio.options.baseUrl}threads/${thread.channel}/${thread.id}/like");
      Response response = await dio.post(
          "threads/${thread.channel}/${thread.id}/like",
          options: await Modular.get<UserPreferencesStore>().authHeader,
          data: {});

      var jsonResponse = response.data;
      if (jsonResponse['status'] == true) return true;
    } catch (e) {
      print(e);
    }

    return false;
  }
}
