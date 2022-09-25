import 'dart:async';

import 'package:flutter/material.dart';
import 'package:temperature_app/additionals/color_picker.dart';
import 'package:temperature_app/pages/first_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const FirstPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(0),
      color: primary,
      child: Stack(
        children: [
          Positioned(
            right: -20,
            top: -20,
            child: Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: primaryLight),
            ),
          ),
          Positioned(
            right: -50,
            top: 100,
            child: Container(
              height: 150,
              width: 150,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: primaryShape),
            ),
          ),

          Positioned(
            left: -50,
            bottom: 50,
            child: Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: primaryLight),
            ),
          ),
          Positioned(
            left: -75,
            bottom: 200,
            child: Container(
              height: 150,
              width: 150,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: primaryShape),
            ),
          ),
          const Center(
            child: Text('TempApp', style: TextStyle(
              color: white,
              fontFamily: 'Montserrat-Bold',
              fontSize: 50
            ),),
          ),

          Container(
            padding: const EdgeInsets.only(bottom: 50),
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: Text('By Mochammad Hairullah', style: TextStyle(
                color: white,
                fontFamily: 'Montserrat-Regular'
              ),),
            ),
          )
        ],
      ),
    );
  }
}
