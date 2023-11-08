// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// List<CameraDescription>?cameras=[];
// class Camera extends StatefulWidget {
//   const Camera({super.key});

//   @override
//   State<Camera> createState() => _CameraState();
// }

// class _CameraState extends State<Camera> {
//    CameraController? _cameraContRoller;
//    var cameraValue;
//   @override
//   void initState() {
    
//     super.initState();
//     _cameraContRoller=CameraController(cameras![0], ResolutionPreset.high);
//     cameraValue=_cameraContRoller?.initialize();
    
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         FutureBuilder(builder: (context, snapshot) {
//           if (snapshot.connectionState==ConnectionState.done){
//             return CameraPreview(_cameraContRoller!);
//           }
//           return CircularProgressIndicator();
          
//         },
//         future: cameraValue,
//         ),

//       ],
//     );
//   }

// }

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  List<CameraDescription> cameras = [];

  CameraController? _cameraController;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the camera controller and get the list of available cameras
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);

    _initializeControllerFuture = _cameraController!.initialize();

    if (!mounted) {
      return;
    }

    setState(() {});
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Take Photo'),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the CameraPreview
            return CameraPreview(_cameraController!);
          } else {
            // Otherwise, show a loading indicator
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initializeControllerFuture;
            // Take a picture and save it to a given path
            final XFile picture = await _cameraController!.takePicture();
            // Do something with the picture (e.g., display or save it)
            print('Picture taken at ${picture.path}');
          } catch (e) {
            print('Error: $e');
          }
        },
        child: Icon(Icons.camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}



