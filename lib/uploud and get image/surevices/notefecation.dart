import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class NotificationService extends ChangeNotifier{
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  //initialize
  Future Initialize() async {
    AndroidInitializationSettings androidInitializationSettings =
    AndroidInitializationSettings('ic_launcher');
    IOSInitializationSettings iosInitializationSettings =
    IOSInitializationSettings();
    InitializationSettings initializationSettings =
    InitializationSettings(
        android: androidInitializationSettings,
        iOS: iosInitializationSettings
    );
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  //show notification
  Future InstanceNotification() async {

    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails('channelId', 'channelName', 'channelDescription');
    IOSNotificationDetails iosNotificationDetails =
    IOSNotificationDetails();

    NotificationDetails platform = NotificationDetails(
        android: androidNotificationDetails,
        iOS: iosNotificationDetails
    );
    await _flutterLocalNotificationsPlugin.show(
        0,
        'Flutter says',
        'انت عملت ادد افرح يا سيدي ',
        platform
    );
  }
}