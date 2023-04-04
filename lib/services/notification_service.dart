import 'package:fiteness_x/modals/appGetterSetter.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@drawable/ic_notification_logo');

  final DarwinInitializationSettings darwinInitializationSettings =
      DarwinInitializationSettings();

  Future initializeNotifications() async {
    requestPermissions();
    InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: darwinInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void sendNotification(
      {required int id,
      required String title,
      required String body,
      required DateTime date}) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channelID', 'channelName',
            priority: Priority.high, importance: Importance.max);
    DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails();

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);
    await flutterLocalNotificationsPlugin.schedule(
        id, title, body, date, notificationDetails);
  }

  void cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  void requestPermissions() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  void cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  void rescheduleAllTheNotifications() async {
    await initializeNotifications();
    for (var i = 0; i < getSelectedMeal.length; i++) {
      DateTime mealDateTime = DateTime(
          getSelectedMeal[i].date.year,
          getSelectedMeal[i].date.month,
          getSelectedMeal[i].date.day,
          getSelectedMeal[i].time.hour,
          getSelectedMeal[i].time.minute);
      if (mealDateTime.isAfter(DateTime.now())) {
        sendNotification(
            id: getSelectedMeal[i].notificationsId,
            title: 'Meal Time!',
            body: 'Time to make ${getSelectedMeal[i].mealName}',
            date: mealDateTime);
      }
    }

    for (var i = 0; i < getSelectedWorkout.length; i++) {
      for (var j = 0; j < getSelectedWorkout[i].length; j++) {
        DateTime workoutDateTime = DateTime(
            getSelectedWorkout[i][j].workoutDate.year,
            getSelectedWorkout[i][j].workoutDate.month,
            getSelectedWorkout[i][j].workoutDate.day,
            getSelectedWorkout[i][j].workoutTime.hour,
            getSelectedWorkout[i][j].workoutTime.minute);
        if (workoutDateTime.isAfter(DateTime.now())) {
          sendNotification(
              id: getSelectedWorkout[i][j].notificationID,
              title: 'Workout Time',
              body: 'Time to start the workout and feel better!',
              date: workoutDateTime);
        }
      }
    }
  }
}
