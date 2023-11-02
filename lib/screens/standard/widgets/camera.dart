import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
List<CameraDescription>?cameras=[];
class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
   CameraController? _cameraContRoller;
   var cameraValue;
  @override
  void initState() {
    
    super.initState();
    _cameraContRoller=CameraController(cameras![0], ResolutionPreset.high);
    cameraValue=_cameraContRoller?.initialize();
    
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        FutureBuilder(builder: (context, snapshot) {
          if (snapshot.connectionState==ConnectionState.done){
            return CameraPreview(_cameraContRoller!);
          }
          return CircularProgressIndicator();
          
        },
        future: cameraValue,
        ),

      ],
    );
  }
}
