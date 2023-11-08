import 'package:dth/screens/standard/widgets/despachtable.dart';
import 'package:dth/screens/standard/widgets/orderdrilldown.dart';
import 'package:dth/screens/standard/widgets/teamdrilldown.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/appbar_underline.dart';
import 'package:dth/widgets/headertext.dart';
import 'package:dth/widgets/primary_elevated_button.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:flutter/material.dart';

class DespachScreen extends StatefulWidget {
  const DespachScreen({super.key});

  @override
  State<DespachScreen> createState() => _DespachScreenState();
}

class _DespachScreenState extends State<DespachScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text('Dispatch'),
        bottom: appBarUnderline,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order No:',
                        style: headerText(),
                      ),
                      OrderDropdownWidget()
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Process',
                        style: headerText(),
                      ),
                      Text(
                        'Threading/Wefting',
                        style: labelText(),
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
                        'Box No:',
                        style: headerText(),
                      ),
                      Text(
                        'Display Box No',
                        style: labelText(),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ...List.generate(
                      2,
                      (index) => Text(
                            'Order Items',
                            style: labelText(),
                          )),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Team:',
                        style: headerText(),
                      ),
                      TeamDropdownWidget()
                    ],
                  ),
                  const DespachTableWidget(),
                ],
              ),
            ),
            hSpace(10),
            SizedBox(
              width: double.infinity,
              child: PrimaryElevatedButton(
                onPressed: () {},
                label: 'SUBMIT',
              ),
            ),
            hSpace(10),
          ],
        ),
      ),
    );
  }
}
