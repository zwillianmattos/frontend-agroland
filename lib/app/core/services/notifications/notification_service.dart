import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:agro_tools/app/core/env/variables.dart';
import 'package:agro_tools/app/core/interfaces/notification.dart';

class NotificationService implements INotification {
  bool requiresConsent = true;
  NotificationService() {
    print("NOTIFICATION SERVICE");
    initPlatformState();
  }

  Future initPlatformState() async {
    await OneSignal.shared.setAppId(ONESIGNAL_KEY);
    await OneSignal.shared.promptUserForPushNotificationPermission();
    await OneSignal.shared.requiresUserPrivacyConsent();

    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared.setRequiresUserPrivacyConsent(requiresConsent);
    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      event.complete(event.notification);
    });

  }
}
