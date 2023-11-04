import 'package:dth/widgets/headertext.dart';
import 'package:dth/screens/standard/standardpage.dart';
import 'package:dth/screens/standard/widgets/teamdrilldown.dart';
import 'package:dth/screens/standard/widgets/vendordrilldown.dart';
import 'package:dth/widgets/arrowback.dart';
import 'package:dth/screens/standard/widgets/venuedrilldown.dart';
import 'package:dth/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({super.key});

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  String venueValue='Select Venue';
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
            padding: const EdgeInsets.all(8.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Container(
                  height: 60,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(20),
                    color: Colors.blue.shade100
                  ),
                  child: Center(
                    child: Text(DateFormat('yyyy-MM-dd').format(DateTime.now()),style: labelText(),),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('VENUE',style: headerText(),),
                    DropdownWidget(),
                   
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('VENDOR CODE',style: headerText(),),
                    VendorDropdownWidget()
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('TOTAL QTY CHECKED',style: headerText(),),
                    Container(
                                  height: 40,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Colors.white)),
                                  child: Center(
                                    child: TextField(
                                      // controller: _quantityController,
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
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('TEAM',style: headerText(),),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
    
                      ),
                      child: TeamDropdownWidget(),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                  
                ),
                ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo.shade600),
                            textStyle:MaterialStateProperty.all<TextStyle>(
                                    TextStyle(fontSize: 20,),
                                  ), shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                            ),
                            onPressed: () {
                           
                         
                          }, child:Text("POST",style: TextStyle(color: Colors.white),),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
