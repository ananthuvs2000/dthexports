import 'package:dth/screens/standard/widgets/boxdrilldown.dart';
import 'package:dth/screens/standard/widgets/colordrilldown.dart';
import 'package:dth/screens/standard/widgets/customerdrilldown.dart';
import 'package:dth/screens/standard/widgets/sizedrilldown.dart';
import 'package:dth/screens/standard/widgets/texturedrilldown.dart';
import 'package:dth/widgets/headertext.dart';
import 'package:flutter/material.dart';

class OutGoingScreen extends StatefulWidget {
   OutGoingScreen({super.key});
 

  @override
  State<OutGoingScreen> createState() => _OutGoingScreenState();
}

class _OutGoingScreenState extends State<OutGoingScreen> {
   final TextEditingController _quantityController=TextEditingController();
  String name = '';

  void updateName() {
    setState(() {
      name = name + ' 123';
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
    return Container(decoration: BoxDecoration(
     image: DecorationImage(image: AssetImage('assets/images/bg.jpg'),fit: BoxFit.cover)
    ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
       
                    children: [
                      Text(
                        'Customer Name:',
                        style: headerText(),
                      ),
                      CustomeDropDown()
                    ],
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          updateName();
                        },
                        child: Text(
                          'Generate order No:',
                          style: labelText(),
                        )),
                    Container(margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black54)
                      ),
                      padding: EdgeInsets.all(5.0),
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
                        SizedBox(width: 8,),
                        Container(padding: EdgeInsets.only(right: 10),
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.transparent)),
                      child: Center(
                        child: TextField(textAlign: TextAlign.center,
                          controller: _quantityController,
                          style: TextStyle(
                              fontSize: 16,
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
                    
                     Container(margin: EdgeInsets.only(right: 8),
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
                SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('2nd Contitioning',style: headerText(),),
                    Row(
                      children: [
                        Text('YES',style: labelText(),),
                         SizedBox(width: 15,),
                        Text('NO',style: labelText(),)
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Send For Wefting',style: headerText(),),
                    Row(
                      children: [
                        Text('YES',style: labelText(),),
                        SizedBox(width: 15,),
                        Text('NO',style: labelText(),)
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10,),
                TextButton(onPressed: () {
                  
                }, child: Text('ADD MORE',style: headerText(),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
