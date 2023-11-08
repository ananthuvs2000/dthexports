// import 'package:dth/screens/standard/widgets/camera.dart';
import 'package:dth/screens/standard/widgets/camera.dart';
import 'package:dth/screens/standard/widgets/texturedrilldown.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/appbar_underline.dart';
import 'package:dth/widgets/drop_down_menu_field.dart';
import 'package:dth/widgets/headertext.dart';
import 'package:dth/screens/standard/widgets/boxdrilldown.dart';
import 'package:dth/screens/standard/widgets/colordrilldown.dart';
import 'package:dth/screens/standard/widgets/sizedrilldown.dart';
import 'package:dth/widgets/open_camera_button.dart';
import 'package:dth/widgets/primary_elevated_button.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AcceptPage extends StatefulWidget {
  const AcceptPage({super.key});

  @override
  State<AcceptPage> createState() => _AcceptPageState();
}

class _AcceptPageState extends State<AcceptPage> {
  double? boxweight;

  final TextEditingController _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: const Text('ACCEPTANCE'),
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: appBarUnderline,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(20),
                        color: Colors.blue.shade100),
                    child: Center(
                      child: Text(
                        DateFormat('yyyy-MM-dd hh:mm:a').format(DateTime.now()),
                        style: labelText(),
                      ),
                    ),
                  ),
                 
                  hSpace(15),
                  DropdownMenuField(
                    controller: TextEditingController(),
                    fieldLabel: 'Box No:',
                    dropDownLabel: 'Select Box ',
                    dropdownEntries: const [
                      DropdownMenuEntry(value: '1', label: '1'),
                      DropdownMenuEntry(value: '2', label: '2'),
                      DropdownMenuEntry(value: '3', label: '3'),
                    ],
                    onSelected: (selectedVal) {
                      print(selectedVal.toString());
                    },
                  ),
                  
                  hSpace(15),
                  DropdownMenuField(
                    controller: TextEditingController(),
                    fieldLabel: 'Size:',
                    dropDownLabel: 'Select Size',
                    dropdownEntries: const [
                       DropdownMenuEntry(value: '32', label: '32'),
                      DropdownMenuEntry(value: '40', label: '40'),
                    ],
                    onSelected: (selectedVal) {
                      print(selectedVal.toString());
                    },
                  ),
                  hSpace(15),
                   DropdownMenuField(
                    controller: TextEditingController(),
                    fieldLabel: 'Color:',
                    dropDownLabel: 'Select Color',
                    dropdownEntries: const [
                       DropdownMenuEntry(value: 'RED', label: 'RED'),
                      DropdownMenuEntry(value: 'BlACK', label: 'BlACK'),
                    ],
                    onSelected: (selectedVal) {
                      print(selectedVal.toString());
                    },
                  ),
                  hSpace(15),
                   DropdownMenuField(
                    controller: TextEditingController(),
                    fieldLabel: 'Texture:',
                    dropDownLabel: 'Select Texture',
                    dropdownEntries: const [
                     
                    ],
                    onSelected: (selectedVal) {
                      print(selectedVal.toString());
                    },
                  ),
                  hSpace(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Process:',
                        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
                      ),
                      Text(
                        'RAW MATERIAL',
                        style: labelText(),
                      ),
                    ],
                  ),
                  hSpace(25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Material Qty:',
                        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
                      ),
                      Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.transparent)),
                        child: Center(
                          child: TextField(
                            controller: _quantityController,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                            decoration: const InputDecoration(
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  hSpace(35),
                  // TextButton.icon(
                  //     icon: const Icon(Icons.camera_alt_outlined),
                  //     onPressed: () {
                  //       Get.to(CameraScreen());
                  //     },
                  //     label: Text(
                  //       'Add Photo',
                  //       style: labelText(),
                  //     )),
                  OpenCameraButton(label: 'Open Camera', onTap: () {
                    Get.to(CameraScreen());
                  },),
                  hSpace(20),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Add More +',
                        style: TextStyle(fontSize: 18),
                      )),
                  hSpace(30),
                  SizedBox(
                    width: 120,
                    child: PrimaryElevatedButton(
                        onPressed: () {}, label: 'SUBMIT'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
