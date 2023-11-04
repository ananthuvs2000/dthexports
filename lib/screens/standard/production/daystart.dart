import 'package:dth/screens/standard/widgets/boxdrilldown.dart';
import 'package:dth/screens/standard/widgets/teamdrilldown.dart';
import 'package:dth/widgets/arrowback.dart';
import 'package:dth/widgets/headertext.dart';
import 'package:dth/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DayStart extends StatefulWidget {
  const DayStart({super.key});

  @override
  State<DayStart> createState() => _DayStartState();
}

class _DayStartState extends State<DayStart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
     image: DecorationImage(image: AssetImage('assets/images/bg.jpg'),fit: BoxFit.cover)
    ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            elevation: 0,
          backgroundColor: Colors.transparent,
          title: Container(alignment: Alignment.center,
          padding: EdgeInsets.only(right: 45),
            height: 40,
            child: Image.asset('assets/images/appbar.jpg',fit: BoxFit.cover)),
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,))
          
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Display Batch NO:',
                      style: headerText(),
                    ),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Box No:',
                      style: headerText(),
                    ),
                    BoxDropdownWidget(),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 80,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade300,
                      ),
                      child: Text(
                        'Display All The Stored Info of Box',
                        style: labelText(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Process:  ',
                      style: headerText(),
                    ),
                    Container(margin: EdgeInsets.only(right: 8),
                      alignment: Alignment.center,
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                       border: Border.all( color: Colors.grey.shade700,)
                      ),
                      child: Text(
                        'Display Process',
                        style: labelText(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Team:',
                      style: headerText(),
                    ),
                    TeamDropdownWidget()
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt_outlined),
                          Text(
                              'OPEN CAMERA  - BOX WITH MATERIAL '),
                        ],
                      ),
                    ),
                    Container(margin: EdgeInsets.only(right: 8),
                        alignment: Alignment.center,
                        height: 60,
                        width: 200,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('ENTER WT SHOWN IN SCREEN: XXX',
                            style: labelText())),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'MATERIAL WT:  ',
                        style: headerText(),
                      ),
                      Container(margin: EdgeInsets.only(right: 8),
                          alignment: Alignment.center,
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text('CALCULATE WT & DISPLAY ', style: labelText())),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10,right: 8),
                  alignment: Alignment.center,
                  height: 50,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'DISPLAY ADDED WORKERS ',
                    style: labelText(),
                  ),
                ),
                SizedBox(height: 50,),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.indigo),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Get.snackbar('Done','',snackPosition: SnackPosition.BOTTOM);
                  },
                  child: Text(
                    " SUBMIT ",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
