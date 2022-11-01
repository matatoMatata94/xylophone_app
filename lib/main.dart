import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({super.key});

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  AudioPlayer note1 = AudioPlayer();

  void playSound(int noteNumber) async {
    ByteData bytes = await rootBundle.load('assets/note$noteNumber.wav');
    Uint8List soundbytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    int result = await note1.playBytes(soundbytes);
    if (result == 1) {
      //play success
      print("Sound playing successful.");
    } else {
      print("Error while playing sound.");
    }
  }

  Expanded xylophoneButton({required int noteNumber, required Color color}) {
    return Expanded(
      child: MaterialButton(
        onPressed: () async {
          playSound(noteNumber);
        },
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              xylophoneButton(noteNumber: 1, color: Colors.red),
              xylophoneButton(noteNumber: 2, color: Colors.orange),
              xylophoneButton(noteNumber: 3, color: Colors.yellow),
              xylophoneButton(noteNumber: 4, color: Colors.green),
              xylophoneButton(noteNumber: 5, color: Colors.teal),
              xylophoneButton(noteNumber: 6, color: Colors.blue),
              xylophoneButton(noteNumber: 7, color: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
