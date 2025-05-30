import 'package:flutter/material.dart';
import 'package:quizz_app/screens/onboardingScreen.dart';

void main() => runApp(
  MaterialApp(debugShowCheckedModeBanner: false, home: OnboardingScreen()),
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Icon> scoreKeeper = [];

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
                    scoreKeeper.add(Icon(Icons.check, color: Colors.green));
                  }),
                },
            child: Text("Ture"),
          ),
          ElevatedButton(
            onPressed:
                () => {
                  setState(() {
                    scoreKeeper.add(Icon(Icons.close, color: Colors.red));
                  }),
                },
            child: Text("False"),
          ),
          Row(children: scoreKeeper),
        ],
      ),
    );
  }
}
