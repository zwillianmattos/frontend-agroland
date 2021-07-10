import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plant_care/app/core/utils/user_preferences_store.dart';
import 'package:plant_care/app/modules/main/submodules/community/models/replies_model.dart';
import '../models/thread_model.dart';

part 'thread_repository.g.dart';

abstract class ThreadDatasource {
  Future<List<dynamic>?> load();
  Future<List<dynamic>?> store();
  Future<List<dynamic>?> delete();
}

@Injectable(singleton: false)
class ThreadRepository implements ThreadDatasource {
  final Dio dio;

  ThreadRepository(this.dio);

  @override
  Future<List<Thread>?> load() async {
    List<Thread> lista = [];
    try {
      print(dio.options.baseUrl);

      Response response = await dio.get('/threads',
          options: await Modular.get<UserPreferencesStore>().authHeader);

      print(response.realUri);
      var jsonResponse = response.data;
      // var jsonResponse = null;

      List<dynamic> list = jsonResponse;
      if (list != null) {
        list.asMap().forEach((key, value) {
          print(value);
          lista.add(Thread.fromJson(value));
        });
      }

      // data.forEach((e) {
      //   print(e);
      //   return list.add(Thread.fromJson(e));
      // });

      print(lista);
    } catch (e) {
      print(e);
    }

    return lista;
  }

  find({required String channel, required String threadId}) async {
    Thread? thread;

    try {
      Response response = await dio.get("threads/${channel}/${threadId}",
          options: await Modular.get<UserPreferencesStore>().authHeader);
      print(response.realUri);
      var jsonResponse = response.data;

      print(jsonResponse);

      List<dynamic> list = jsonResponse;
      if (list != null) {
        thread = Thread.fromJson(list[0]);
      }
    } catch (e) {
      print(e);
    }

    return thread;
  }

  @override
  Future<List<dynamic>?> store() async {}

  @override
  Future<List<dynamic>?> delete() async {}

  @override
  Future<Replies?> send({
    required Replies replie,
    required Thread thread,
  }) async {
    Replies? replieData;

    try {
      Response response = await dio.post(
          "threads/${thread.channel}/${thread.id}/replies",
          options: Modular.get<UserPreferencesStore>().authHeader,
          data: {
            'body': replie.body,
          });

      var jsonResponse = response.data;
      replieData = Replies.fromJson(jsonResponse['replie']);

      print(replieData.toJson());
    } catch (e) {
      print(e);
    }

    return replieData;
  }
}
