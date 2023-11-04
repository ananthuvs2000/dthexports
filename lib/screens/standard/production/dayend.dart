import 'package:dth/screens/standard/widgets/boxdrilldown.dart';
import 'package:dth/screens/standard/widgets/table.dart';
import 'package:dth/widgets/headertext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DayEndScreen extends StatefulWidget {
  const DayEndScreen({super.key});

  @override
  State<DayEndScreen> createState() => _DayEndScreenState();
}

class _DayEndScreenState extends State<DayEndScreen> {
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
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Container(
                      padding: EdgeInsets.all(5),
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
                    Container(padding: EdgeInsets.all(8),
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
                    Container(padding: EdgeInsets.all(6),
                        alignment: Alignment.center,
                        height: 60,
                        width: 300,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                            'DISPLAY THE BASIC STORED INFO OF THAT BOX “DAY START"',
                            style: labelText())),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'PROCESS:  ',
                      style: headerText(),
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 180,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('DISPLAY PROCESS', style: labelText())),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red.shade800),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                          TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Get.snackbar('OPEN CAMERA', '',snackPosition: SnackPosition.BOTTOM);
                      },
                      child: Text(
                        "PRS. COMPLETED",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('APPLY FORMULA', style: labelText())),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red.shade800),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                          TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      onPressed: () {
                        
                      },
                      child: Text(
                        "BALANCE:",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('APPLY FORMULA', style: labelText())),
                  ],
                ),
                SizedBox(height: 10,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Container(
                        alignment: Alignment.centerRight,
                        height: 80,
                        width: 160,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('TOTAL PRS WASTAGE%', style: labelText())),
                        Container(padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        height: 80,
                        width: 160,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('AUTO CALC TOTAL % WASTAGE', style: labelText())),
                  ],
                ),SizedBox(height: 20,),
              
                  TableWidget(),
                  SizedBox(height: 20,),
                  ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo.shade700),
                            textStyle:MaterialStateProperty.all<TextStyle>(
                                    TextStyle(fontSize: 20,),
                                  ), shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                            ),
                            onPressed: () {
                            
                         
                          }, child:Text(" SUBMIT ",style: TextStyle(color: Colors.white),),),
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}