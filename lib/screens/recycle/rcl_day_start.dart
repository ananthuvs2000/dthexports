import 'package:dth/screens/standard/widgets/teamdrilldown.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/MainHeading.dart';
import 'package:dth/widgets/drop_down_menu_field.dart';
import 'package:dth/widgets/dt_text_field.dart';
import 'package:dth/widgets/dynamic_field_row.dart';
import 'package:dth/widgets/open_camera_button.dart';
import 'package:dth/widgets/primaryElevatedButton.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:flutter/material.dart';

class RecycleDayStartScreen extends StatefulWidget {
  const RecycleDayStartScreen({super.key});

  @override
  State<RecycleDayStartScreen> createState() => _RecycleDayStartPageState();
}

class _RecycleDayStartPageState extends State<RecycleDayStartScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/bg.jpg'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Image.asset(
            'assets/images/appbar.jpg',
            width: appBarTitleImageWidth,
            fit: BoxFit.contain,
          ),
        ),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
            children: [
              const Center(
                child: MainHeading(
                  text: 'RCL-DAY Start',
                ),
              ),
              hSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OpenCameraButton(
                    onTap: () {},
                  ),
                  wSpace(20),
                  // Field to Enter Value
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'Enter Value Shown (XX.XXX KG)',
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                        DthTextField(
                          controller: TextEditingController(),
                          validator: (value) {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
              hSpace(15),
              DropdownMenuField(
                fieldLabel: 'Box No.',
                dropdownEntries: [],
                onSelected: (selectedVal) {},
              ),

              /// Details of Stored Info Of Selected Box
              hSpace(10),
              Container(
                padding: const EdgeInsets.all(30),
                color: Colors.red,
                width: double.infinity,
                height: 100,
              ),
              // Auto Calculated Field
              hSpace(15),
              const Divider(),
              hSpace(5),
              const DynamicFieldRow(label: 'Material QTY:', value: 'Calculated'),
              const DynamicFieldRow(label: 'Process:', value: 'Displayed'),

              // Worker Team Area

              // No. Of Days Counter
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'No. Of Days: ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  wSpace(100),
                  IconButton.filled(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                  ),
                  Expanded(
                    child: DthTextField(
                      controller: TextEditingController(),
                      validator: (p0) {},
                    ),
                  ),
                  IconButton.filled(
                    onPressed: () {},
                    icon: const Icon(Icons.remove),
                  ),
                ],
              ),

              // End of listview
              hSpace(15),
              PrimaryElevatedButton(
                onPressed: () {},
                label: 'Post',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
