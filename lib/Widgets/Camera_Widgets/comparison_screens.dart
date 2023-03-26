import 'dart:io';

import 'package:fiteness_x/Widgets/Camera_Widgets/photo_gallary.dart';
import 'package:fiteness_x/modals/appGetterSetter.dart';
import 'package:fiteness_x/modals/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';

class PhotoComparison extends StatefulWidget {
  const PhotoComparison({super.key});

  @override
  State<PhotoComparison> createState() => _PhotoComparisonState();
}

class _PhotoComparisonState extends State<PhotoComparison> {
  List<ImageModal> imagePaths = [];

  void addImagesForComparison() async {
    await showModalBottomSheet(
        context: context,
        builder: (_) {
          return PhotoGallary();
        }).then((selectedImageIndex) {
      setState(() {
        imagePaths.insert(imagePaths.length, getImagePaths[selectedImageIndex]);
      });
    });
  }

  Widget photoViewBuilder(var constraints, int index) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black))),
      height: constraints.maxHeight * 0.5,
      width: constraints.maxWidth,
      child: (imagePaths.length > 0 && imagePaths.length >= index)
          ? Stack(
              children: [
                PhotoView(
                  imageProvider: FileImage(imagePaths[index - 1].filepath),
                  maxScale: PhotoViewComputedScale.contained * 3.0,
                  minScale: PhotoViewComputedScale.contained * 0.8,
                  initialScale: PhotoViewComputedScale.contained,
                ),
                Positioned(
                    left: 5,
                    top: 5,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                      child: Text(
                        DateFormat.yMEd()
                            .format(imagePaths[index - 1].imageClickDate),
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    )),
              ],
            )
          : GestureDetector(
              onTap: () {
                addImagesForComparison();
              },
              child: Center(
                child: Icon(
                  Icons.add_box_rounded,
                  color: Color(0xFF7F94FF),
                  size: 30,
                ),
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF92A3FD),
        elevation: 0,
        title: Text(
          'Comparison',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height -
            (AppBar().preferredSize.height +
                MediaQuery.of(context).padding.top),
        width: MediaQuery.of(context).size.width,
        child: LayoutBuilder(
          builder: (_, constraints) {
            return Column(
              children: [
                photoViewBuilder(constraints, 1),
                photoViewBuilder(constraints, 2),
              ],
            );
          },
        ),
      ),
    );
  }
}
