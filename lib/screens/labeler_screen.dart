// ignore_for_file: avoid_unnecessary_containers, duplicate_ignore, unnecessary_null_comparison, deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class LabelerScreen extends StatefulWidget {
  const LabelerScreen({Key? key}) : super(key: key);

  @override
  State<LabelerScreen> createState() => _LabelerScreenState();
}

class _LabelerScreenState extends State<LabelerScreen> {
  File? _image;
  final picker = ImagePicker();
  final ImageLabeler imageLabeler = GoogleMlKit.vision.imageLabeler();
  // ignore: prefer_typing_uninitialized_variables
  var result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Labeling'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Center(
                  child: _image == null
                      ? const Text('No image selected.')
                      : Image.file(_image!),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Center(
                  child: result == null
                      ? const Text('Nothing here')
                      : Text(
                          result,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 24, right: 8),
        child: FloatingActionButton(
          onPressed: getImage,
          tooltip: 'Pick Image',
          backgroundColor: const Color(0xFFffafcc),
          child: const Icon(Icons.add_a_photo, color: Colors.black),
        ),
      ),
    );
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        processImageLabels();
      } else {
        print('No image selected.');
      }
    });
  }

  processImageLabels() async {
    InputImage myImage = InputImage.fromFile(_image!);
    ImageLabeler labeler = GoogleMlKit.vision.imageLabeler();
    var _imageLabels = await labeler.processImage(myImage);
    result = "";
    for (ImageLabel imageLabel in _imageLabels) {
      setState(() {
        result = result +
            imageLabel.label +
            ":" +
            imageLabel.confidence.toString() +
            "\n";
      });
    }
  }
}
