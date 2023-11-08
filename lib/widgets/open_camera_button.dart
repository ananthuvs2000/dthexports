import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        height: 120.h,
        width: 150.w,
        padding: EdgeInsets.all(15.h),
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
              size: 32,
            ),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
              ),
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
