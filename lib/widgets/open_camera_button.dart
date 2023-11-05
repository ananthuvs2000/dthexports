import 'package:flutter/material.dart';

const double borderRad = 15;

class OpenCameraButton extends StatelessWidget {
  const OpenCameraButton({
    required this.label,
    required this.onTap,
    super.key,
  });
  final void Function()? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.indigo,
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRad),
      child: Ink(
        height: 100,
        width: 150,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRad),
          color: Colors.grey.shade800,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
              size: 36,
            ),
            Text(
              label,
              style: const TextStyle(color: Colors.white),
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
