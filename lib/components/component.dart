import 'package:flutter/material.dart';
import 'package:temperature_app/additionals/color_picker.dart';

class Component {
  final stackBg = Container(
    padding: const EdgeInsets.all(0),
    height: 225.0,
    width: double.infinity,
    color: Colors.transparent,
  );

  final stackShapeRectangle = Container(
    padding: const EdgeInsets.all(0),
    height: 200.0,
    width: double.infinity,
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80.0)),
        color: primary),
  );
}

class ButtonPage {
  final elevatedButton = Positioned(
    top: 80,
    right: 25,
    child: ElevatedButton(
      onPressed: () {},
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
