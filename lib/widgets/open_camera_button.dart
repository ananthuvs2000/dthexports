import 'package:flutter/material.dart';

const double borderRad = 15;

class OpenCameraButton extends StatelessWidget {
  const OpenCameraButton({
    required this.onTap,
    super.key,
  });
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.indigo,
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRad),
      child: Ink(
        width: 200,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRad),
          color: Colors.grey.shade800,
        ),
        child: const Column(
          children: [
            Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
              size: 36,
            ),
            Text(
              'Open Camera To Take Photo Of Weighing Machine - \nBox With Material',
              style: TextStyle(color: Colors.white),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
