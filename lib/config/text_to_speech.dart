import 'package:flutter_tts/flutter_tts.dart';

class Speech {
  FlutterTts flutterTts = FlutterTts();
  speak(String text) async {
    await flutterTts.setLanguage("ar-EG");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }
}
