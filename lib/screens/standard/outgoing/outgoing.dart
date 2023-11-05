import 'package:dth/screens/standard/widgets/boxdrilldown.dart';
import 'package:dth/screens/standard/widgets/colordrilldown.dart';
import 'package:dth/screens/standard/widgets/customerdrilldown.dart';
import 'package:dth/screens/standard/widgets/sizedrilldown.dart';
import 'package:dth/screens/standard/widgets/texturedrilldown.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/appbar_underline.dart';
import 'package:dth/widgets/headertext.dart';
import 'package:dth/widgets/primaryElevatedButton.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:flutter/material.dart';

class OutGoingScreen extends StatefulWidget {
  const OutGoingScreen({super.key});

  @override
  State<OutGoingScreen> createState() => _OutGoingScreenState();
}

class _OutGoingScreenState extends State<OutGoingScreen> {
  final TextEditingController _quantityController = TextEditingController();
  String name = '';

//^ To be handled with state management
  void updateName() {
    setState(() {
      name = '$name 123';
    });
  }

  String selectedOption = 'Yes';
  void _handleRadioValueChange(String value) {
    setState(() {
      selectedOption = value;
    });
  }

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
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Outgoing'),
          bottom: appBarUnderline,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Customer Name:',
                        style: headerText(),
                      ),
                      CustomeDropDown(),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          updateName();
                        },
                        child: Text(
                          'Generate order No:',
                          style: labelText(),
                        )),
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black54)),
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'ORDER NO: $name',
                        style: labelText(),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Size: ',
                      style: headerText(),
                    ),
                    SizeDropdownWidget()
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Colour: ',
                      style: headerText(),
                    ),
                    ColorDropdownWidget()
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Box No:',
                      style: headerText(),
                    ),
                    BoxDropdownWidget(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Texture:',
                      style: headerText(),
                    ),
                    TextureDropdownWidget()
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'REQ. QTY',
                          style: headerText(),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 10),
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.transparent)),
                          child: Center(
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: _quantityController,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        margin: const EdgeInsets.only(right: 8),
                        alignment: Alignment.center,
                        height: 35,
                        width: 110,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('Total Qty', style: labelText())),
                  ],
                ),
                // Container(height: 60,

                //   child: Column(
                //      children: [
                //       RadioListTile(
                //           title: Text('Yes'),
                //           value: 'Yes',
                //           groupValue: selectedOption,
                //           onChanged: (value) {
                //             _handleRadioValueChange(value!);
                //           },
                //         ),
                //         RadioListTile(
                //           title: Text('No'),
                //           value: 'No',
                //           groupValue: selectedOption,
                //           onChanged:  (value) {
                //             _handleRadioValueChange(value!);
                //           },
                //         ),

                //     ],
                //   )
                // )
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '2nd Contitioning',
                      style: headerText(),
                    ),
                    Row(
                      children: [
                        Text(
                          'YES',
                          style: labelText(),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'NO',
                          style: labelText(),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Send For Wefting',
                      style: headerText(),
                    ),
                    Row(
                      children: [
                        Text(
                          'YES',
                          style: labelText(),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'NO',
                          style: labelText(),
                        )
                      ],
                    )
                  ],
                ),
                hSpace(15),
                PrimaryElevatedButton(
                  onPressed: () {},
                  label: 'ADD MORE',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
