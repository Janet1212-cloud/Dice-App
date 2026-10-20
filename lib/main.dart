import 'package:flutter/material.dart';

import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DiceApp (),
    );
  }
}
class DiceApp extends StatefulWidget {
  const DiceApp ({super.key});

  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
int leftDiceNumber = 5;
int rightDiceNumber = 6;
void changeDiceFace(){
  setState(() {
    leftDiceNumber = Random().nextInt(6)+1;
    rightDiceNumber = Random().nextInt(6)+1;
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text("DiceApp"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: DiceSection(
            leftDiceNumber: leftDiceNumber,
            rightDiceNumber: rightDiceNumber,
            onRoll: changeDiceFace,
          ),
        ),
     ),
    );
  }
}

class DiceSection extends StatelessWidget {
  final int leftDiceNumber;
  final int rightDiceNumber;
  final VoidCallback onRoll;
  const DiceSection({
    super.key,
    required this.leftDiceNumber,
    required this.rightDiceNumber,
    required this.onRoll,

  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onRoll,
      child: Row(
      children: [
        Expanded(child: Image.asset("assets/dice$leftDiceNumber.png")),
        SizedBox(width: 16,),
        Expanded(child: Image.asset("assets/dice$rightDiceNumber.png")),

      ],
      ),
    );
  }
}

