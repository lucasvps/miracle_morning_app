import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:miracle_morning_app/app/core/interfaces/local_notification_interface.dart';
import 'package:miracle_morning_app/app/core/stores/auth_store.dart';

class LocalNotificationService implements ILocalNotification {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  Future pushNotification() async {
    print('works');
    var time = Time(8, 0, 0);
    // var scheduledNotificationDateTime =
    //     DateTime.now().add(Duration(seconds: 10));

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      'Channel for Alarm notification',
      icon: 'wallpaperegito',
      //sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
      largeIcon: DrawableResourceAndroidBitmap('rocket'),
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
        //sound: 'a_long_cold_sting.wav',
        presentAlert: true,
        presentBadge: true,
        presentSound: true);
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
        0,
        Modular.get<AuthStore>().userName != null
            ? 'Eiii, ' + Modular.get<AuthStore>().userName + "!"
            : "Eiii",
        'Já realizou os ativadores do milagre da manhã hoje? Não se esqueça de marcar para manter seu progresso!',
        time,
        platformChannelSpecifics,
        payload: 'Default_Sound');
  }
}
