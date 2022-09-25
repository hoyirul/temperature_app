import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:temperature_app/additionals/color_picker.dart';
import 'package:temperature_app/components/component.dart';
import 'package:temperature_app/models/temperature_model.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final TextEditingController input = TextEditingController();

  late double kelvin = 0, reamur = 0, fahrentheit = 0, celcius = 0;

  getData() async {
    //  Rumus C + 273
    setState(() {
      // ignore: unrelated_type_equality_checks
      if (input.text != '') {
        celcius = (input.text == '') ? 0 : double.parse(input.text);
        TemperatureModel(celcius);
      } else {
        final snackBar = SnackBar(
            content: const Text('Input must be filled!', style: TextStyle(fontFamily: 'Montserrat-Regular', fontSize: 14, color: primary),),
            backgroundColor: white,
            action: SnackBarAction(
              label: 'dismiss',
              onPressed: () {
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Component().stackBg,
            Component().stackShapeRectangle,
            Positioned(
              top: 20,
              left: -60,
              child: Container(
                padding: const EdgeInsets.all(0),
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: primaryLight),
              ),
            ),
            Positioned(
              right: -30,
              top: -20,
              child: Container(
                padding: const EdgeInsets.all(0),
                height: 150,
                width: 150,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: primaryLight),
              ),
            ),
            Positioned(
              right: 40,
              top: 70,
              child: Container(
                padding: const EdgeInsets.all(0),
                height: 120,
                width: 130,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: primaryShape),
              ),
            ),
            Positioned(
              top: 75,
              left: 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Hi, Hairullah',
                    style: TextStyle(
                        color: white,
                        fontFamily: 'Montserrat-Bold',
                        fontSize: 25.0),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Welcome to the TempApp',
                    style: TextStyle(
                        color: white,
                        fontFamily: 'Montserrat-Regular',
                        fontSize: 16.0),
                  ),
                ],
              ),
            ),
            ButtonPage().elevatedButton,
            Positioned(
              top: 170,
              child: Container(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 10, bottom: 10),
                        height: double.infinity,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(12.0)),
                        child: TextFormField(
                          controller: input,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: "Enter temperature (Celcius)",
                              hintStyle: TextStyle(
                                  fontFamily: 'Montserrat-Regular',
                                  fontSize: 15,
                                  color: hintText)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          getData();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Column(
                            children: const [
                              Center(
                                child:
                                    Icon(Icons.refresh_rounded, color: primary),
                              ),
                              Center(
                                child: Text(
                                  'Convert',
                                  style: TextStyle(
                                      fontSize: 8.0,
                                      fontFamily: 'Montserrat-SemiBold'),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        Container(
          padding:
              const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 15),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Conversion Result',
              style:
                  TextStyle(fontFamily: 'Montserrat-SemiBold', fontSize: 18.0),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyResultWidget(params: (input.text == '') ? 0.0 : TemperatureModel(celcius).getKelvin(), title: 'Kelvin', celcius: celcius,),
                  MyResultWidget(params: (input.text == '') ? 0.0 : TemperatureModel(celcius).getReamur(), title: 'Reamur', celcius: celcius,),
                ],
              ),

              const SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyResultWidget(params: (input.text == '') ? 0.0 : TemperatureModel(celcius).getFahrentheit(), title: 'Fahrentheit', celcius: celcius,),
                  MyResultWidget(params: (input.text == '') ? 0.0 : TemperatureModel(celcius).getCelcius(), title: 'Celcius', celcius: celcius,),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MyResultWidget extends StatefulWidget {
  const MyResultWidget({super.key, required this.params, required this.title, required this.celcius});

  final double params, celcius;
  final String title;

  @override
  State<MyResultWidget> createState() => _MyResultWidgetState();
}

class _MyResultWidgetState extends State<MyResultWidget> {
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
          child: Text(
            widget.title,
            style: const TextStyle(
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
            children: [
              Text(
                '${widget.params}',
                style: const TextStyle(
                    fontFamily: 'Montserrat-Bold', fontSize: 40, color: white),
              ),
              Text(
                '${widget.celcius} Celcius = ${widget.params} ${widget.title}',
                style: const TextStyle(color: white, fontSize: 9),
              ),
            ],
          ),
        )
      ],
    );
  }
}
