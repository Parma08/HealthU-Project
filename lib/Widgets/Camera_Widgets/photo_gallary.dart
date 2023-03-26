import 'dart:io';

import 'package:fiteness_x/modals/appGetterSetter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PhotoGallary extends StatelessWidget {
  PhotoGallary({super.key}) {
    print(getImagePaths.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 20),
        margin: EdgeInsets.symmetric(vertical: 20),
        color: Color.fromARGB(255, 208, 233, 253),
        child: ListView.builder(
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () => Navigator.of(context).pop(index),
              child: Container(
                  width: 150,
                  height: 300,
                  child: Image.file(getImagePaths[index].filepath)),
            );
          },
          itemCount: getImagePaths.length,
        ),
      ),
    );
  }
}
