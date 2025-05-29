import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Icon> scorKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Hello World"),
          ElevatedButton(
            onPressed:
                () => {
                  setState(() {
                    scorKeeper.add(Icon(Icons.check, color: Colors.green));
                  }),
                },
            child: Text("Ture"),
          ),
          ElevatedButton(
            onPressed:
                () => {
                  setState(() {
                    scorKeeper.add(Icon(Icons.close, color: Colors.red));
                  }),
                },
            child: Text("False"),
          ),
          Row(children: scorKeeper),
        ],
      ),
    );
  }
}
