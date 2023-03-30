import 'package:fiteness_x/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePageQuickLook extends StatelessWidget {
  const ProfilePageQuickLook({super.key});

  Widget userDataTileBuilder(String data, String propertyName) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 252, 252, 252),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.10),
                offset: Offset(0, 1),
                blurRadius: 7),
          ],
          borderRadius: BorderRadius.circular(22)),
      height: 100,
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data,
            style: TextStyle(color: Color(0xFF92A3FD), fontSize: 16),
          ),
          Text(propertyName, style: TextStyle(fontSize: 14))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            leading: Stack(children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 3,
                          color: Color.fromRGBO(0, 0, 0, 0.12),
                          offset: Offset(0, 1))
                    ]),
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SvgPicture.asset(
                  'assets/images/profile_pic_illustration.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ]),
            title: Text(
              'Parmanand Singh',
              style: TextStyle(fontSize: 14),
            ),
            subtitle: Text(
              'Loose a fat program',
              style: TextStyle(fontSize: 12),
            ),
            trailing: Container(
              width: 80,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: primaryLinearGradient,
                  borderRadius: BorderRadius.circular(30)),
              child: const Text(
                'Edit',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            userDataTileBuilder('180cm', 'Height'),
            userDataTileBuilder('65kg', 'Weight'),
            userDataTileBuilder('22yo', 'Age'),
          ],
        )
      ],
    );
  }
}
