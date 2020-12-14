import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:mobx/mobx.dart';
part 'speech.g.dart';

class Speech = _SpeechBase with _$Speech;

abstract class _SpeechBase with Store {
  @observable
  bool _hasSpeech = false;

  @observable
  double level = 0.0;

  @observable
  String lastWords = "";

  @observable
  String lastError = "";

  @observable
  String lastStatus = "";

  @observable
  String _currentLocaleId = "";

  @observable
  SpeechToText speech = SpeechToText();

  @observable
  bool salvar = false;

  @action
  Future<void> initSpeechState() async {
    
      bool hasSpeech = await speech.initialize(
          onError: errorListener, onStatus: statusListener);
      if (hasSpeech) {
        var systemLocale = await speech.systemLocale();
        _currentLocaleId = systemLocale.localeId;
      }
      _hasSpeech = hasSpeech;
    
  }

  @action
  void startListening() {
    salvar = false;
    lastWords = "";
    lastError = "";
    speech.listen(
        onResult: resultListener,
        listenFor: Duration(seconds: 10),
        localeId: _currentLocaleId,
        onSoundLevelChange: soundLevelListener,
        cancelOnError: true,
        partialResults: true);
  }

  @action
  void stopListening() {
    speech.stop();
    level = 0.0;
  }

  void cancelListening() {
    speech.cancel();
    level = 0.0;
  }

  @action
  void resultListener(SpeechRecognitionResult result) {
    lastWords = "${result.recognizedWords}";    
    salvar = result.finalResult ? result.finalResult:false;
  }

  @action
  void soundLevelListener(double level) {
    this.level = level;
  }

  @action
  void errorListener(SpeechRecognitionError error) {
    lastError = "${error.errorMsg} - ${error.permanent}";  
  }

  @action
  void statusListener(String status) {
    lastStatus = "$status";
  }
}
