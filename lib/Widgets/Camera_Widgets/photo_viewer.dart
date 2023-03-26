import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewer extends StatelessWidget {
  File imagePath;
  PhotoViewer({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoView(
        imageProvider: FileImage(imagePath),
        maxScale: PhotoViewComputedScale.contained * 10.0,
        minScale: PhotoViewComputedScale.contained * 0.8,
        initialScale: PhotoViewComputedScale.contained,
      ),
    );
  }
}
