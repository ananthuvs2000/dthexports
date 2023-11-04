import 'package:dth/screens/standard/widgets/camera.dart';
import 'package:dth/screens/standard/widgets/texturedrilldown.dart';
import 'package:dth/widgets/headertext.dart';
import 'package:dth/screens/standard/standardpage.dart';
import 'package:dth/screens/standard/widgets/boxdrilldown.dart';
import 'package:dth/screens/standard/widgets/colordrilldown.dart';
import 'package:dth/screens/standard/widgets/sizedrilldown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AcceptPage extends StatefulWidget {
   AcceptPage({super.key});
  

  @override
  State<AcceptPage> createState() => _AcceptPageState();
}

class _AcceptPageState extends State<AcceptPage> {

 
  
  double? boxweight;
  final TextEditingController _quantityController = TextEditingController();
  
  

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
          leading: IconButton(
              onPressed: () {
                Get.to(StandardScreen());
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              )),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(20),
                      color: Colors.blue.shade100),
                  child: Center(
                    child: Text(
                      DateFormat('yyyy-MM-dd').format(DateTime.now()),
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
                SizedBox(
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
                SizedBox(height: 25),
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
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                // ElevatedButton(
    
                //   onPressed: () {
                //     showDialog(
                //             context: context,
                //             builder: (BuildContext context) {
                //               return AlertDialog(
                //                 content: Container(
                //                   height: 150,
                //                   width: 100,
                //                   child: Column(
                //                     mainAxisAlignment: MainAxisAlignment.center,
                //                     children: [
                //                       Text('${_'),
                //                     ],
                //                   ),
                //                 ),
                //               );
                //             });
    
                // }, child: Text('Show Material Weight',style: labelText(),)),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset('assets/images/camera.png'),
                    ),
                    TextButton(
                        onPressed: () {
                          // Get.to(Camera());
                        },
                        child: Text(
                          'Add Photo',
                          style: labelText(),
                        )),
                  ],
                ),
                SizedBox(height: 50,),
                 ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo.shade700),
                            textStyle:MaterialStateProperty.all<TextStyle>(
                                    TextStyle(fontSize: 20,),
                                  ), shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                            ),
                            onPressed: () {
                            Get.snackbar('POST', 'Success');
                         
                          }, child:Text("SUBMIT",style: TextStyle(color: Colors.white),),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
