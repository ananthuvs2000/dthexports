import 'dart:io';
import 'package:dth/theme/colors.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/_common_widgets/loading_display_caption.dart';
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
    return (image != null)
        ? Container(
            width: double.infinity,
            height: 250,
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor.withOpacity(0.35),
                  offset: const Offset(-2, 2),
                  blurRadius: 15,
                )
              ],
              borderRadius: BorderRadius.circular(globalBorderRadius),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: FileImage(
                  File(image!.path),
                ),
              ),
            ),
          )
        : const SizedBox(
            height: 50,
            child: Center(
              child: LoadingDisplayCaption(message: 'Image not taken yet'),
            ),
          );
  }
}
