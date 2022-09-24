import 'package:flutter/material.dart';
import 'package:temperature_app/additionals/color_picker.dart';
import 'package:temperature_app/partials/widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: bg
      ),
      home: const MyHomePage(title: 'Temperature App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MyWidget(),

            Container(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 15),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text('Conversion Result', style: TextStyle(
                  fontFamily: 'Montserrat-SemiBold',
                  fontSize: 18.0
                ),),
              ),
            ),

            const MyResultWidget(),
          ],
        ),
      )
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
