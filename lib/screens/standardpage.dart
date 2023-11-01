import 'package:dth/widgets/arrowback.dart';
import 'package:dth/widgets/boxcontainer.dart';
import 'package:flutter/material.dart';

class StandardScreen extends StatefulWidget {
  const StandardScreen({super.key});

  @override
  State<StandardScreen> createState() => _StandardScreenState();
}

class _StandardScreenState extends State<StandardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[ 
          Padding(
            padding: const EdgeInsets.only(top: 35,left: 8),
            child: ArrowBack(),
          ),
          Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BoxContainer(text: 'PRODUCTION'),
                  BoxContainer(text: 'INCOMING'),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BoxContainer(text: 'DISPATCH'),
                  BoxContainer(text: 'OUTGOING'),
                ],
              ),
            ],
          ),
        ),
        ]
      ),
    );
  }
}
