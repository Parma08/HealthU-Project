import 'package:fiteness_x/TabScreens/profile.dart';
import 'package:fiteness_x/Widgets/Home_Screen_Widgets/reset_password_screen.dart';
import 'package:fiteness_x/Widgets/profile_page_widgets/profile_info_screen.dart';
import 'package:fiteness_x/Widgets/utils/info_page.dart';
import 'package:fiteness_x/modals/constants.dart';
import 'package:fiteness_x/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../profile_page_widgets/notificatons_screen.dart';

class ProfilePageList extends StatelessWidget {
  List<Map<String, dynamic>> listItems;
  String listName;
  ProfilePageList({required this.listItems, required this.listName}) {}

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 252, 252, 252),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.10),
                offset: Offset(0, 1),
                blurRadius: 7),
          ],
          borderRadius: BorderRadius.circular(22)),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              listName,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          ...listItems.map((item) {
            return GestureDetector(
              onTap: () {
                if (item['title'] == 'Profile') {
                  ProfileScreen().gotoPage(context, ProfileInfoScreen());
                } else if (item['title'] == 'Reset Password') {
                  ProfileScreen().gotoPage(context, ResetPasswordScreen());
                } else if (item['title'] == 'Notifications') {
                  ProfileScreen().gotoPage(context, NotificationsScreen());
                } else if (item['title'] == 'Privacy Policy') {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return InfoPage(
                        heading: 'Privacy Policy', content: PRIVACY_POLICY);
                  }));
                }
              },
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10, bottom: 15),
                    child: SvgPicture.asset(
                      item['iconLink'],
                      height: 25,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 10, bottom: 15),
                      child: Text(
                        item['title'],
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF7B6F72)),
                      )),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(right: 10, bottom: 15),
                    alignment: Alignment.centerRight,
                    child: item['title'] == 'Notification'
                        ? Switch(
                            value: true,
                            onChanged: (val) {},
                            activeTrackColor: Color(0xFFC58BF2),
                            activeColor: Color.fromARGB(255, 255, 255, 255),
                          )
                        : SvgPicture.asset(
                            'assets/images/Icon-Arrow.svg',
                            height: 30,
                          ),
                  )),
                ],
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}
