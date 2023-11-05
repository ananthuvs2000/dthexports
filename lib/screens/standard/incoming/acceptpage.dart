// import 'package:dth/screens/standard/widgets/camera.dart';
import 'package:dth/screens/standard/widgets/texturedrilldown.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/appbar_underline.dart';
import 'package:dth/widgets/headertext.dart';
import 'package:dth/screens/standard/widgets/boxdrilldown.dart';
import 'package:dth/screens/standard/widgets/colordrilldown.dart';
import 'package:dth/screens/standard/widgets/sizedrilldown.dart';
import 'package:dth/widgets/primaryElevatedButton.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:flutter/material.dart';
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'BOX NO:',
                      style: headerText(),
                    ),
                    BoxDropdownWidget(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SIZE:',
                      style: headerText(),
                    ),
                    SizeDropdownWidget()
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'COLOR:',
                      style: headerText(),
                    ),
                    ColorDropdownWidget()
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'TEXTURE:',
                      style: headerText(),
                    ),
                    TextureDropdownWidget()
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'PROCESS:',
                      style: headerText(),
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
                      'MATERIAL QTY:',
                      style: headerText(),
                    ),
                    Container(
                      height: 40,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white)),
                      child: Center(
                        child: TextField(
                          controller: _quantityController,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400),
                          decoration: const InputDecoration(
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                hSpace(35),
                TextButton.icon(
                    icon: const Icon(Icons.camera_alt_outlined),
                    onPressed: () {
                      // Get.to(Camera());
                    },
                    label: Text(
                      'Add Photo',
                      style: labelText(),
                    )),
                hSpace(30),
                SizedBox(
                  width: 120,
                  child: PrimaryElevatedButton(onPressed: () {}, label: 'SUBMIT'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
