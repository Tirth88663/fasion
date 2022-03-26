// // ignore_for_file: prefer_const_constructors
//
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:tflite/tflite.dart';
//
// import '../main.dart';
//
// class EmotionScreen extends StatefulWidget {
//   const EmotionScreen({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<EmotionScreen> createState() => _EmotionScreenState();
// }
//
// class _EmotionScreenState extends State<EmotionScreen> {
//   CameraImage? cameraImage;
//   CameraController? cameraController;
//   String output = '';
//
//   @override
//   void initState() {
//     super.initState();
//
//     loadCamera();
//     loadModel();
//   }
//
//   loadCamera() {
//     cameraController = CameraController(cameras![0], ResolutionPreset.medium);
//     cameraController?.initialize().then((value) {
//       if (!mounted) {
//         return;
//       } else {
//         setState(() {
//           cameraController?.startImageStream((imageStream) {
//             cameraImage = imageStream;
//             runModel();
//           });
//         });
//       }
//     });
//   }
//
//   runModel() async {
//     if (cameraImage != null) {
//       var prediction = await Tflite.runModelOnFrame(
//           bytesList: cameraImage!.planes.map((plane) {
//             return plane.bytes;
//           }).toList(),
//           imageHeight: cameraImage!.height,
//           imageWidth: cameraImage!.width,
//           imageMean: 127.5,
//           imageStd: 127.5,
//           rotation: 90,
//           numResults: 2,
//           threshold: 0.1,
//           asynch: true);
//       prediction?.forEach((element) {
//         setState(() {
//           output = element['label'];
//         });
//       });
//     }
//   }
//
//   loadModel() async {
//     await Tflite.loadModel(
//         model: "assets/model.tflite", labels: "assets/labels.txt");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         elevation: 0,
//         title: const Text(
//           "Faceon",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Padding(
//                 padding: EdgeInsets.all(20),
//                 child: Container(
//                   height: MediaQuery.of(context).size.height * 0.7,
//                   width: MediaQuery.of(context).size.width,
//                   child: !cameraController!.value.isInitialized
//                       ? Container()
//                       : AspectRatio(
//                           aspectRatio: cameraController!.value.aspectRatio,
//                           child: CameraPreview(cameraController!),
//                         ),
//                 ),
//               ),
//               Text(
//                 output,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
