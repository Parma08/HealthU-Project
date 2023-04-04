import 'package:fiteness_x/Widgets/Home_Screen_Widgets/reset_password_screen.dart';
import 'package:fiteness_x/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool isNotificationTurnedOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF92A3FD),
        elevation: 0,
        title: Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/images/notification_icon.svg'),
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            'Notifications',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF7B6F72),
                            ),
                          ))
                    ],
                  ),
                  Switch(
                    value: isNotificationTurnedOn,
                    onChanged: (val) {
                      setState(() {
                        if (!val) {
                          NotificationService().cancelAllNotifications();
                        } else {
                          NotificationService().rescheduleAllTheNotifications();
                        }
                        isNotificationTurnedOn = val;
                      });
                    },
                    activeTrackColor: Color(0xFFC58BF2),
                    activeColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
