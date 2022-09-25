import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:temperature_app/additionals/color_picker.dart';
import 'package:temperature_app/components/component.dart';
import 'package:temperature_app/models/history.dart';
import 'package:temperature_app/models/temperature_model.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController input = TextEditingController();

  late String? selected = '';
  late double celcius = 0, result = 0;
  List<History> histories = <History>[];

  convertData() {
    setState(() {
      if (input.text != '' && selected != '') {
        celcius = (input.text == '') ? 0 : double.parse(input.text);
        result = TemperatureModel(celcius).getTemperature(selected!);
        histories
            .add(History(title: selected!, params: result, celcius: celcius));
      } else {
        final snackBar = SnackBar(
          content: const Text(
            'Input must be filled!',
            style: TextStyle(
                fontFamily: 'Montserrat-Regular', fontSize: 14, color: primary),
          ),
          backgroundColor: white,
          action: SnackBarAction(
            label: 'dismiss',
            onPressed: () {},
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Component().stackBg(460),
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
                const ToFirstPage(),
                Positioned(
                  top: 170,
                  child: Container(
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                    height: 285,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(12.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Temperature Form',
                            style: TextStyle(
                              fontFamily: 'Montserrat-SemiBold',
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: bg),
                            child: TextFormField(
                              controller: input,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter temperature (Celcius)',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Montserrat-Regular',
                                    fontSize: 14,
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: bg),
                            child: DropdownButtonFormField(
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: false,
                                  hintText: 'Choose Temperature',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Montserrat-Regular',
                                    fontSize: 14,
                                  )),
                              items: ['Kelvin', 'Reamur', 'Fahrentheit']
                                  .map((String value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                selected = value!;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              // print('done');
                              convertData();
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: primary),
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(0),
                              child: const Center(
                                child: Text(
                                  'Convert Temperature',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat-SemiBold',
                                      color: white,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 10, bottom: 15),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Conversion Result',
                  style: TextStyle(
                      fontFamily: 'Montserrat-SemiBold', fontSize: 18.0),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10.0),
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(0),
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: primary),
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
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: Text(
                            '$selected',
                            style: const TextStyle(
                                fontFamily: 'Montserrat-SemiBold',
                                fontSize: 20.0,
                                color: white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '$result',
                              style: const TextStyle(
                                  fontFamily: 'Montserrat-Bold',
                                  fontSize: 50,
                                  color: white),
                            ),
                            Text(
                              '$celcius Celcius = $result $selected',
                              style: const TextStyle(color: white, fontSize: 9),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 10, bottom: 15),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'List Histories',
                  style: TextStyle(
                      fontFamily: 'Montserrat-SemiBold', fontSize: 18.0),
                ),
              ),
            ),
            ListView.builder(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
              shrinkWrap: true,
              // itemCount: histories.length,
              itemCount: histories.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Container(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      height: 80,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: ListTile(
                          title: Text(
                            histories[index].title,
                            style: const TextStyle(
                                fontFamily: 'Montserrat-SemiBold'),
                          ),
                          subtitle: Text(
                            '${histories[index].celcius} Celcius = ${histories[index].params} ${histories[index].title}',
                            style: const TextStyle(
                                color: Color(
                                  0xffaaaaaa,
                                ),
                                fontSize: 12,
                                fontFamily: 'Montserrat-Regular'),
                          ),
                          trailing: Text(
                            '${histories[index].params}',
                            style: const TextStyle(
                                fontFamily: 'Montserrat-Bold',
                                fontSize: 18,
                                color: primary),
                          ),
                        ),
                      )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
