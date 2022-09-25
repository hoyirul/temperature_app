import 'package:flutter/material.dart';
import 'package:temperature_app/additionals/color_picker.dart';

class FormConvert extends StatefulWidget {
  const FormConvert({super.key});

  @override
  State<FormConvert> createState() => _FormConvertState();
}

class _FormConvertState extends State<FormConvert> {

  TextEditingController input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          // getKelvin();
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          height: double.infinity,
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(12.0)),
          child: Column(
            children: const [
              Center(
                child: Icon(Icons.refresh_rounded, color: primary),
              ),
              Center(
                child: Text(
                  'Convert',
                  style: TextStyle(
                      fontSize: 8.0, fontFamily: 'Montserrat-SemiBold'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class KelvinConvert extends StatefulWidget {
  const KelvinConvert({super.key});

  @override
  State<KelvinConvert> createState() => _KelvinConvertState();
}

class _KelvinConvertState extends State<KelvinConvert> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          height: 150,
          width: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: primary),
        ),
        Positioned(
          bottom: 10,
          right: -30,
          child: Container(
            padding: const EdgeInsets.all(0),
            height: 120,
            width: 120,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: primaryLight,
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 40,
          child: Container(
            padding: const EdgeInsets.all(0),
            height: 80,
            width: 80,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: primaryShape),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15.0),
          child: const Text(
            'Kelvin',
            style: TextStyle(
                fontFamily: 'Montserrat-SemiBold',
                fontSize: 18.0,
                color: white),
          ),
        ),
        Positioned(
          bottom: 15,
          left: 15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '372',
                style: TextStyle(
                    fontFamily: 'Montserrat-Bold', fontSize: 40, color: white),
              ),
              Text(
                '100 Celcius = 372 Kelvin',
                style: TextStyle(color: white, fontSize: 10),
              ),
            ],
          ),
        )
      ],
    );
  }
}
