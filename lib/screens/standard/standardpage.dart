import 'package:dth/screens/standard/acceptpage.dart';
import 'package:dth/screens/standard/checkpage.dart';
import 'package:dth/widgets/arrowback.dart';
import 'package:dth/widgets/boxcontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StandardScreen extends StatefulWidget {
  const StandardScreen({super.key});

  @override
  State<StandardScreen> createState() => _StandardScreenState();
}

class _StandardScreenState extends State<StandardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(top: 35, left: 8),
          child: ArrowBack(),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(child: BoxContainer(text: 'PRODUCTION')),
                  InkWell(
                      onTap: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Container(
                                height: 150,
                                width: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Get.to(CheckPage());
                                        },
                                        child: Text('Check',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black))),
                                    Divider(),
                                    TextButton(
                                        onPressed: () {
                                          Get.to(AcceptPage());
                                        },
                                        child: Text('Accept',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black))),
                                  ],
                                ),
                              ),
                            );
                          }),
                      child: BoxContainer(text: 'INCOMING')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BoxContainer(text: 'DISPATCH'),
                  BoxContainer(text: 'OUTGOING'),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
