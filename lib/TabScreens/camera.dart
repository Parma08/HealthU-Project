import 'dart:io';

import 'package:exif/exif.dart';
import 'package:fiteness_x/Widgets/Camera_Widgets/comparison_screens.dart';
import 'package:fiteness_x/Widgets/Camera_Widgets/photo_viewer.dart';
import 'package:fiteness_x/modals/appGetterSetter.dart';
import 'package:fiteness_x/modals/constants.dart';
import 'package:fiteness_x/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Camera_Screen extends StatefulWidget {
  Camera_Screen({super.key});

  @override
  State<Camera_Screen> createState() => _Camera_ScreenState();
}

class _Camera_ScreenState extends State<Camera_Screen> {
  File? image;

  void openCameraOrGallaryModalSheet(BuildContext context) async {
    await showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            height: 120,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    openCamera('camera');
                    Navigator.of(context).pop();
                  },
                  leading: Icon(Icons.camera_alt_outlined),
                  title: Text('Camera',
                      style: TextStyle(color: Colors.black, fontSize: 14)),
                ),
                ListTile(
                  onTap: () {
                    openCamera('files');
                    Navigator.of(context).pop();
                  },
                  leading: Icon(Icons.photo_size_select_actual),
                  title: Text('Photos',
                      style: TextStyle(color: Colors.black, fontSize: 14)),
                )
              ],
            ),
          );
        });
  }

  void openCamera(String source) async {
    PermissionStatus permissionStatus = await Permission.camera.request();
    var image;
    try {
      if (source == 'camera') {
        image = await ImagePicker().pickImage(source: ImageSource.camera);
      } else if (source == 'files') {
        image = await ImagePicker().pickImage(source: ImageSource.gallery);
      }
      if (image == null) return;
      await saveImagePermanenty(image.path, DateTime.now());
      setState(() {});
    } on PlatformException catch (e) {
      print('FAILED TO PICK IMAGE - $e');
    }
  }

  Future saveImagePermanenty(
      String imagePath, DateTime pictureClickDate) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = imagePath.split('/').last;
    final image = File('${directory.path}/$name');
    final savedImage = await File(imagePath).copy(image.path);
    print("SAVEEEED $savedImage");
    setImagePaths(
        ImageModal(filepath: savedImage, imageClickDate: pictureClickDate));
    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          openCameraOrGallaryModalSheet(context);
        },
        child: Container(
          padding: EdgeInsets.all(20),
          width: 65,
          height: 65,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: secondaryLinearGradient,
              borderRadius: BorderRadius.circular(60)),
          child: Icon(
            Icons.camera_alt_outlined,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height -
            (MediaQuery.of(context).padding.top +
                AppBar().preferredSize.height),
        child: ListView(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                width: MediaQuery.of(context).size.width * 0.90,
                height: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(146, 163, 253, 0.4),
                      Color.fromRGBO(157, 206, 255, 0.4)
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: MediaQuery.of(context).size.width * 0.60,
                            child: RichText(
                                text: const TextSpan(
                              text: 'Track Your Progress Each Month With',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF1D1617)),
                              children: [
                                TextSpan(
                                    text: ' Photo',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF92A3FD))),
                              ],
                            ))),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          alignment: Alignment.center,
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: primaryLinearGradient,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Text(
                            'Learn More',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      margin: EdgeInsets.only(right: 10),
                      child: SvgPicture.asset(
                          'assets/images/progress_tracker.svg'),
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 15),
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width * 0.90,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(146, 163, 253, 0.4),
                      Color.fromRGBO(157, 206, 255, 0.4)
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        'Compare my photos',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1D1617)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return PhotoComparison();
                        }));
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            gradient: primaryLinearGradient),
                        child: Text('Compare',
                            style:
                                TextStyle(fontSize: 12, color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, bottom: 5, top: 5),
              child: Text(
                'Gallary',
                style: TextStyle(
                    color: Color(0xFF1D1617),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            ...getImagePaths.map((imagePaths) {
              return Center(
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return PhotoViewer(imagePath: imagePaths.filepath);
                        }));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(imagePaths.filepath),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                        ),
                        child: Text(
                          DateFormat.yMEd().format(imagePaths.imageClickDate),
                          style: TextStyle(
                              color: Color.fromARGB(255, 209, 217, 255),
                              fontSize: 10),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
