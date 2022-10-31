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

  void playSound(String note) async {
    ByteData bytes = await rootBundle.load('assets/$note.wav');
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
              Expanded(
                child: MaterialButton(
                  onPressed: () async {
                    playSound('note1');
                  },
                  color: Colors.red,
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () async {
                    playSound('note2');
                  },
                  color: Colors.orange,
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () async {
                    playSound('note3');
                  },
                  color: Colors.yellow,
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () async {
                    playSound('note4');
                  },
                  color: Colors.green,
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () async {
                    playSound('note5');
                  },
                  color: Colors.teal,
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () async {
                    playSound('note6');
                  },
                  color: Colors.blue,
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () async {
                    playSound('note7');
                  },
                  color: Colors.purple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
