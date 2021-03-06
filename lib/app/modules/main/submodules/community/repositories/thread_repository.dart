import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:agro_tools/app/core/models/models/paginate_model.dart';
import 'package:agro_tools/app/core/utils/user_preferences_store.dart';
import 'package:agro_tools/app/modules/main/submodules/community/models/replies_model.dart';
import '../models/thread_model.dart';

part 'thread_repository.g.dart';

abstract class ThreadDatasource {
  Future<PaginateModel> load();
  Future<Thread?> store({required Thread thread});
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
      var jsonResponse = response.data;
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
  Future<Thread?> store({required Thread thread}) async {
    try {
      print({'channel_id': 1, 'body': jsonEncode(thread.body)});
      Response response = await dio.post("threads",
          options: await Modular.get<UserPreferencesStore>().authHeader,
          data: {'channel_id': 1, 'body': jsonEncode(thread.body)});
      var jsonResponse = response.data;
      return Thread.fromJson(jsonResponse['thread']);
    } catch (e) {
      print(e);
    }
  }

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
  Future<List<dynamic>?> removeThread({
    required String channelId,
    required String threadId,
  }) async {
    Response response = await dio.delete(
      "threads/$channelId/$threadId",
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

  Future<String?> uploadFile(String filePath, String fileName) async {
    try {
      var form =
          FormData.fromMap({'file': MultipartFile.fromFileSync(filePath)});

      Response response = await dio.post("upload/document",
          options: await Modular.get<UserPreferencesStore>().authHeader,
          data: form);

      var jsonResponse = response.data;
      if (jsonResponse['status'] == true)
        return jsonResponse['data']['file_cloudinary'];
    } catch (e) {
      print(e);
    }

    return null;
  }
}
