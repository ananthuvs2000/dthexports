import 'package:flutter/material.dart';

// class TableNumberEntry extends StatefulWidget {
//    TableNumberEntry({required this.iController});
//    TextEditingController iController=TextEditingController();

//   @override
//   State<TableNumberEntry> createState() => _TableNumberEntryState();
// }

// class _TableNumberEntryState extends State<TableNumberEntry> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: 30,
//         alignment: Alignment.topCenter,
        
//         decoration: BoxDecoration(border: Border.all(color: Colors.transparent)),
//         child: Center(
//           child: TextFormField(
//             textAlign: TextAlign.center,
//             keyboardType: TextInputType.number,
//             controller: TextEditingController(),
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600,fontSize: 16),
//             decoration: InputDecoration(
              
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   width: 1,
//                   color: Colors.black.withOpacity(0.25),
//                 ),
//               ),
//               focusedBorder: InputBorder.none,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



class TableNumberEntry extends StatefulWidget {
   TableNumberEntry({required this.iController});
   TextEditingController iController=TextEditingController();

  @override
  State<TableNumberEntry> createState() => _TableNumberEntryState();
}

class _TableNumberEntryState extends State<TableNumberEntry>{
  FocusNode _focusNode = FocusNode();

  @override

  
void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override

  
void dispose() {
    super.dispose();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      print('1');

    }
    else{
      print('Current value: ${widget.iController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 35,
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
        ),
        child: Center(
          child: TextFormField(
            controller: widget.iController,
            focusNode: _focusNode,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.black.withOpacity(0.25),
                ),
              ),
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}