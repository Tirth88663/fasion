// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fasion/screens/about_screen.dart';
import 'package:fasion/screens/labeler_screen.dart';
import 'package:fasion/screens/text_reco_screen.dart';
import 'package:flutter/material.dart';

import '../theme/config.dart';
import '../theme/theme.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        leading: GestureDetector(
          onTap: () {
            currentTheme.switchTheme();
            setState(
              () {},
            );
          },
          child: Icon(MyTheme.isLight
              ? Icons.nightlight_round
              : Icons.wb_sunny_outlined),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Icon(Icons.info_outline),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AboutScreen()));
              },
            ),
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TextRecoScreen()));
                  },
                  child: Card(
                    elevation: 5,
                    color:
                        MyTheme.isLight ? Color(0xFFffc8dd) : Color(0xFFF086A3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          "Text Recognition",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LabelerScreen()));
                  },
                  child: Card(
                    elevation: 5,
                    color:
                        MyTheme.isLight ? Color(0xFFffc8dd) : Color(0xFFF086A3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Center(
                        child: Text(
                          "Image Labeling",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
