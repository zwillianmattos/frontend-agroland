import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NotificationService implements Disposable {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late final AndroidInitializationSettings initializationSettingsAndroid;
  late final InitializationSettings initializationSettings;
  late final NotificationDetails platformChannelSpecifics;
  late final AndroidNotificationDetails androidPlatformChannelSpecifics;

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    Modular.to.pop();
    await Modular.to.pushNamed('/');
  }

  NotificationService() {
    initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
    androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'com.example.plant_care', 'geral', 'geral_notifications',
        importance: Importance.max, priority: Priority.high, showWhen: false);
    platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    _init();
  }

  _schedule() async {
    // await flutterLocalNotificationsPlugin.zonedSchedule(
    //     0,
    //     'scheduled title',
    //     'scheduled body',
    //     tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
    //     const NotificationDetails(
    //         android: AndroidNotificationDetails(
    //             'com.example.plant_care', 'geral', 'geral_notifications')),
    //     androidAllowWhileIdle: true,
    //     uiLocalNotificationDateInterpretation:
    //         UILocalNotificationDateInterpretation.absoluteTime);

    await flutterLocalNotificationsPlugin.periodicallyShow(
        0,
        'Últimas notícias',
        'Mantenha-se atualizado, entre e confira as novas noticias do mundo agro',
        RepeatInterval.daily,
        platformChannelSpecifics,
        androidAllowWhileIdle: true);
  }

  _init() async {
    print('Notification Service');

    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('America/Sao_Paulo'));

    await this._schedule();
    // await this.notify();
  }

  Future<dynamic> selectNotification(String? payload) async {
    if (payload != null) {
      print('notification payload: $payload');
    }
    return await Modular.to.pushNamed("/");
  }

  notify() async {
    // await flutterLocalNotificationsPlugin.show(
    //     0, 'plain title', 'plain body', platformChannelSpecifics,
    //     payload: 'item x');
  }

  @override
  void dispose() {
    this.dispose();
  }
}
