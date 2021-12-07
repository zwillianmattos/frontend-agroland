import 'package:mobx/mobx.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:agro_tools/app/core/env/variables.dart';
import 'package:agro_tools/app/core/interfaces/notification.dart';
import 'package:universal_io/io.dart' as IO;

part 'notification_service.g.dart';

class NotificationService = _NotificationServiceBase with _$NotificationService;

abstract class _NotificationServiceBase with Store implements INotification {
  @observable
  bool requiresConsent = true;

  _NotificationServiceBase() {
    print("NOTIFICATION SERVICE");
    initPlatformState();
  }

  @action
  Future initPlatformState() async {
    OneSignal.shared.setLogLevel(OSLogLevel.info, OSLogLevel.none);
    await OneSignal.shared.setAppId(ONESIGNAL_KEY);

    // await OneSignal.shared.setRequiresUserPrivacyConsent(requiresConsent);
    // await OneSignal.shared.userProvidedPrivacyConsent();

    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      print("Accepted permission: $accepted");
    });

    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      event.complete(event.notification);
    });
  }

  @action
  setRequiresConsent(bool value) {
    requiresConsent = value;
    OneSignal.shared.setRequiresUserPrivacyConsent(requiresConsent);
  }

  OneSignal getInstance() {
    return OneSignal.shared;
  }
}
