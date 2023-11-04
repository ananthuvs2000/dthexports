import 'package:dth/screens/standard/widgets/despachtable.dart';
import 'package:dth/screens/standard/widgets/orderdrilldown.dart';
import 'package:dth/screens/standard/widgets/teamdrilldown.dart';
import 'package:dth/widgets/headertext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DespachScreen extends StatefulWidget {
  const DespachScreen({super.key});

  @override
  State<DespachScreen> createState() => _DespachScreenState();
}

class _DespachScreenState extends State<DespachScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
     image: DecorationImage(image: AssetImage('assets/images/bg.jpg'),fit: BoxFit.cover)
    ),
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(right: 45),
                height: 40,
                child:
                    Image.asset('assets/images/appbar.jpg', fit: BoxFit.cover)),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                ))),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Order No:',style: headerText(),),
                    OrderDropdownWidget()
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Process',style: headerText(),),
                    Text('Threading/Wefting',style: labelText(),)
                  ],
                ),
                SizedBox(height: 20,),
                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Box No:',style: headerText(),),
                    Text('Display Box No',style: labelText(),)
                  ],
                ),SizedBox(height: 20,),
                ...List.generate(2, (index) => Text('Order Items',style: labelText(),)),
                SizedBox(height: 20,),
                
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Team:',style: headerText(),),
                    TeamDropdownWidget()
                  ],
                ),
                DespachTableWidget(),
                SizedBox(height: 50),
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
                          Get.snackbar('DONE', '',snackPosition: SnackPosition.BOTTOM,duration: Duration(seconds: 1));
                       
                        }, child:Text("  SUBMIT  ",style: TextStyle(color: Colors.white),),),
              ],
              
            ),
          ),
        ),
      ),
    );
  }
}