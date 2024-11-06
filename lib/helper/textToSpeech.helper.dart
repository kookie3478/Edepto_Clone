import 'dart:async';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

class TextToSpeechHelper {
  static late FlutterTts flutterTts;
  static late Timer soundWaveTimer;
  static late Timer timer;
  static RxInt activeBar = 100.obs;
  static RxInt second = 0.obs;
  static RxInt minute = 00.obs;
  static RxBool isPlaying = false.obs;
  static RxInt currentWordStart = 0.obs;
  static RxInt currentWordEnd = 0.obs;
  static int previousWordStart = 0;
  static int previousWordEnd = 0;
  static bool isAfterPause = false;
  static int currentWordStartAfterPause = 0;
  static int currentWordEndAfterPause = 0;
  static bool isInit = false;

  static init() {
    flutterTts = FlutterTts();
    isInit = true;
  }

  static Future<void> speak(String newsText, String language) async {
    if (isPlaying.value) {
      // stopSpeaking();
      await flutterTts.pause();
    } else {
      soundWaveAnimation();
      isPlaying.value = !isPlaying.value;
      await flutterTts.setLanguage(language);
      await flutterTts.speak(newsText);

      flutterTts.setContinueHandler(
        () {
          isAfterPause = true;
          currentWordStartAfterPause = previousWordStart + 1;
          currentWordEndAfterPause = previousWordEnd + 1;
        },
      );

      flutterTts.setPauseHandler(
        () {
          isPlaying.value = !isPlaying.value;
          stopSoundWaveAnimation();
        },
      );

      flutterTts.setCompletionHandler(
        () {
          stopSoundWaveAnimation(isCompleted: true);
        },
      );
    }
  }

  static stopSpeaking() async {
    await flutterTts.stop();
    resetAll();
  }

  static soundWaveAnimation() {
    soundWaveTimer = Timer.periodic(
      const Duration(milliseconds: 250),
      (timer) {
        activeBar.value = activeBar.value == 6 ? 0 : (activeBar.value % 6) + 1;
      },
    );
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (second.value == 59) {
        second.value = 00;
        minute.value++;
      } else {
        second.value++;
      }
    });
  }

  static stopSoundWaveAnimation({bool isCompleted = false}) {
    soundWaveTimer.cancel();
    timer.cancel();

    if (isCompleted) {
      activeBar.value = 100;
      second.value = 0;
      minute.value = 0;
    }
  }

  static resetAll() async {
      await flutterTts.stop();

    if (activeBar.value != 100) {
      stopSoundWaveAnimation(isCompleted: true);
    }

    isPlaying.value = false;
    activeBar.value = 100;
    minute.value = 0;
    second.value = 0;
  }
}
