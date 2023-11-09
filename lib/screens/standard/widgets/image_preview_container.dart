import 'dart:io';

import 'package:dth/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePreviewBox extends StatelessWidget {
  const ImagePreviewBox({
    super.key,
    required this.image,
  });
  final XFile? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(globalBorderRadius),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: FileImage(
            File(image!.path),
          ),
        ),
      ),
    );
  }
}
