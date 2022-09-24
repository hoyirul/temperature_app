import 'package:flutter/material.dart';
import 'package:temperature_app/additionals/color_picker.dart';
import 'package:temperature_app/components/component.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                      print('Oke');
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
                            child: Icon(Icons.refresh_rounded, color: primary),
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
    );
  }
}

class MyResultWidget extends StatefulWidget {
  const MyResultWidget({super.key});

  @override
  State<MyResultWidget> createState() => _MyResultWidgetState();
}

class _MyResultWidgetState extends State<MyResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
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
                        shape: BoxShape.circle,
                        color: primaryShape
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(15.0),
                    child: const Text('Kelvin', style: TextStyle(
                      fontFamily: 'Montserrat-SemiBold',
                      fontSize: 18.0,
                      color: white
                    ),),
                  ),

                  Positioned(
                    bottom: 15,
                    left: 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('372', style: TextStyle(
                          fontFamily: 'Montserrat-Bold',
                          fontSize: 40,
                          color: white
                        ),),
                        Text('100 Celcius = 372 Kelvin', style: TextStyle(
                          color: white,
                          fontSize: 10
                        ),),
                      ],
                    ),
                  )
                ],
              ),

              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(0),
                    height: 150,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: primary),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
