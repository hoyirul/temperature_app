import 'package:flutter/material.dart';
import 'package:temperature_app/additionals/color_picker.dart';
import 'package:temperature_app/pages/first_page.dart';
import 'package:temperature_app/pages/second_page.dart';

class Component {
  stackBg(double height){
    return Container(
      padding: const EdgeInsets.all(0),
      height: height,
      width: double.infinity,
      color: Colors.transparent,
      // color: Colors.amber,
    );
  }

  final stackShapeRectangle = Container(
    padding: const EdgeInsets.all(0),
    height: 200.0,
    width: double.infinity,
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80.0)),
        color: primary),
  );
}

class ToSecondPage extends StatelessWidget {
  const ToSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
    top: 80,
    right: 25,
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondPage()));
      },
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          backgroundColor: MaterialStateColor.resolveWith((states) => white)),
      child: const Text(
        'Second Page',
        style: TextStyle(color: primary, fontFamily: 'Montserrat-SemiBold'),
      ),
    ),
  );
  }
}

class ToFirstPage extends StatelessWidget {
  const ToFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
    top: 80,
    right: 25,
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const FirstPage()));
      },
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          backgroundColor: MaterialStateColor.resolveWith((states) => white)),
      child: const Text(
        'First Page',
        style: TextStyle(color: primary, fontFamily: 'Montserrat-SemiBold'),
      ),
    ),
  );
  }
}
