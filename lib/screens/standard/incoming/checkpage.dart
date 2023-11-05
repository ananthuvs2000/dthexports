import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/appbar_underline.dart';
import 'package:dth/widgets/headertext.dart';
import 'package:dth/screens/standard/widgets/teamdrilldown.dart';
import 'package:dth/screens/standard/widgets/vendordrilldown.dart';
import 'package:dth/screens/standard/widgets/venuedrilldown.dart';
import 'package:dth/widgets/primaryElevatedButton.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({super.key});

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  String venueValue = 'Select Venue';
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
          backgroundColor: Colors.white,
          title: const Text('CHECKING'),
          bottom: appBarUnderline,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    'VENUE',
                    style: headerText(),
                  ),
                  DropdownWidget(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'VENDOR CODE',
                    style: headerText(),
                  ),
                  VendorDropdownWidget()
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'TOTAL QTY CHECKED',
                    style: headerText(),
                  ),
                  Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white)),
                    child: const Center(
                      child: TextField(
                        // controller: _quantityController,
                        style: TextStyle(
                            fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'TEAM',
                    style: headerText(),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TeamDropdownWidget(),
                  )
                ],
              ),
              hSpace(40),
              SizedBox(width: 120, child: PrimaryElevatedButton(onPressed: () {}, label: 'POST')),
              hSpace(120),
            ],
          ),
        ),
      ),
    );
  }
}
