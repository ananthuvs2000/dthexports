import 'package:dth/_common_widgets/spacer.dart';
import 'package:dth/_models/production_daystart_model.dart';
import 'package:dth/theme/text_sizing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BoxInfoDisplay extends StatefulWidget {
  const BoxInfoDisplay({
    required this.box,
    super.key,
  });
  final BoxData box;

  @override
  State<BoxInfoDisplay> createState() => _BoxInfoDisplayState();
}

class _BoxInfoDisplayState extends State<BoxInfoDisplay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.box.boxRef,
          style: TextStyles.mainHeadingStyle,
        ),
        const Divider(),
        GridView.count(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          childAspectRatio: 5,
          crossAxisCount: 2,
          children: [
            Center(
              child: InfoItem(
                icon: FontAwesomeIcons.weightHanging,
                label: widget.box.materialQty,
              ),
            ),
            Center(
              child: InfoItem(
                icon: Icons.texture,
                label: widget.box.textureRef,
              ),
            ),
            Center(
              child: InfoItem(
                icon: CupertinoIcons.resize,
                label: widget.box.sizeRef,
              ),
            ),
            Center(
              child: InfoItem(
                icon: Icons.palette,
                label: widget.box.colorRef,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

const infoTextSize = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

class InfoItem extends StatelessWidget {
  InfoItem({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 18,
          ),
          wSpace(10),
          Text(
            label,
            style: infoTextSize,
          ),
        ],
      ),
    );
  }
}
