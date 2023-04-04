import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Widgets/onboardingandloginwidgets/profile_page_lists.dart';
import '../Widgets/onboardingandloginwidgets/profile_page_quick_look.dart';

class ProfileScreen extends StatelessWidget {
  void gotoPage(BuildContext context, Widget pageName) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return pageName;
    }));
  }

  List<Map<String, dynamic>> accountPageItems = [
    {
      'iconLink': 'assets/images/Icon-Profile.svg',
      'title': 'Profile',
    },
    {'iconLink': 'assets/images/Setting.svg', 'title': 'Reset Password'},
    {
      'iconLink': 'assets/images/notification_icon.svg',
      'title': 'Notifications'
    },

    // {'iconLink': 'assets/images/Icon-Activity.svg', 'title': 'Activity'},
    // {'iconLink': 'assets/images/Icon-Workout.svg', 'title': 'Workout'},
    // {'iconLink': 'assets/images/Icon-Achievement.svg', 'title': 'Achievements'},
  ];
  List<Map<String, dynamic>> otherPageItems = [
    {'iconLink': 'assets/images/Icon-Message.svg', 'title': 'Contact us'},
    {'iconLink': 'assets/images/Shield-Done.svg', 'title': 'Privacy Policy'},
  ];
  List<Map<String, dynamic>> notificationPageItems = [
    {
      'iconLink': 'assets/images/notification_icon.svg',
      'title': 'Notification'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProfilePageQuickLook(),
        ProfilePageList(
          listItems: accountPageItems,
          listName: 'Account',
        ),
        // ProfilePageList(
        //   listItems: notificationPageItems,
        //   listName: 'Notification',
        // ),
        ProfilePageList(
          listItems: otherPageItems,
          listName: 'Others',
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
