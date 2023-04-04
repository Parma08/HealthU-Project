import 'package:fiteness_x/Widgets/profile_page_widgets/profile_edit_screen.dart';
import 'package:fiteness_x/modals/appGetterSetter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class ProfileInfoScreen extends StatefulWidget {
  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  List<Map<String, dynamic>> profileInfo = [];
  initializeProfileInfo() {
    profileInfo = [
      {'labelName': 'First Name', 'value': getUserDetails.firstName},
      {'labelName': 'Last Name', 'value': getUserDetails.lastName},
      {
        'labelName': 'Date Of Birth',
        'value': DateFormat.yMMMd().format(getUserDetails.dateOfBirth)
      },
      {
        'labelName': 'Gender',
        'value': getGenderEnumToStringConvertor(getUserDetails.gender)
      },
      {'labelName': 'Height', 'value': '${getUserDetails.heightInCM}cm'},
      {'labelName': 'Weight', 'value': '${getUserDetails.weightInKgs}kg'},
    ];
  }

  @override
  Widget build(BuildContext context) {
    initializeProfileInfo();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF92A3FD),
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return ProfileEditScreen();
                })).then((value) {
                  setState(() {});
                });
              },
              icon: Icon(Icons.edit)),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              width: 200,
              height: 200,
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: SvgPicture.asset(
                'assets/images/profile_pic_illustration.svg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height -
                  (AppBar().preferredSize.height +
                      MediaQuery.of(context).padding.top +
                      240),
              child: ListView.builder(
                itemBuilder: (_, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    margin: EdgeInsets.symmetric(),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              profileInfo[index]['labelName'],
                              style: TextStyle(
                                  color: Color(0xFF7B6F72), fontSize: 16),
                            ),
                            Text(profileInfo[index]['value'],
                                style: TextStyle(
                                    color: Color(0xFF7B6F72), fontSize: 16)),
                          ],
                        ),
                        Divider()
                      ],
                    ),
                  );
                },
                itemCount: profileInfo.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
