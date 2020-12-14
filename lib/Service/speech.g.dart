// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speech.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Speech on _SpeechBase, Store {
  final _$_hasSpeechAtom = Atom(name: '_SpeechBase._hasSpeech');

  @override
  bool get _hasSpeech {
    _$_hasSpeechAtom.reportRead();
    return super._hasSpeech;
  }

  @override
  set _hasSpeech(bool value) {
    _$_hasSpeechAtom.reportWrite(value, super._hasSpeech, () {
      super._hasSpeech = value;
    });
  }

  final _$levelAtom = Atom(name: '_SpeechBase.level');

  @override
  double get level {
    _$levelAtom.reportRead();
    return super.level;
  }

  @override
  set level(double value) {
    _$levelAtom.reportWrite(value, super.level, () {
      super.level = value;
    });
  }

  final _$lastWordsAtom = Atom(name: '_SpeechBase.lastWords');

  @override
  String get lastWords {
    _$lastWordsAtom.reportRead();
    return super.lastWords;
  }

  @override
  set lastWords(String value) {
    _$lastWordsAtom.reportWrite(value, super.lastWords, () {
      super.lastWords = value;
    });
  }

  final _$lastErrorAtom = Atom(name: '_SpeechBase.lastError');

  @override
  String get lastError {
    _$lastErrorAtom.reportRead();
    return super.lastError;
  }

  @override
  set lastError(String value) {
    _$lastErrorAtom.reportWrite(value, super.lastError, () {
      super.lastError = value;
    });
  }

  final _$lastStatusAtom = Atom(name: '_SpeechBase.lastStatus');

  @override
  String get lastStatus {
    _$lastStatusAtom.reportRead();
    return super.lastStatus;
  }

  @override
  set lastStatus(String value) {
    _$lastStatusAtom.reportWrite(value, super.lastStatus, () {
      super.lastStatus = value;
    });
  }

  final _$_currentLocaleIdAtom = Atom(name: '_SpeechBase._currentLocaleId');

  @override
  String get _currentLocaleId {
    _$_currentLocaleIdAtom.reportRead();
    return super._currentLocaleId;
  }

  @override
  set _currentLocaleId(String value) {
    _$_currentLocaleIdAtom.reportWrite(value, super._currentLocaleId, () {
      super._currentLocaleId = value;
    });
  }

  final _$speechAtom = Atom(name: '_SpeechBase.speech');

  @override
  SpeechToText get speech {
    _$speechAtom.reportRead();
    return super.speech;
  }

  @override
  set speech(SpeechToText value) {
    _$speechAtom.reportWrite(value, super.speech, () {
      super.speech = value;
    });
  }

  final _$salvarAtom = Atom(name: '_SpeechBase.salvar');

  @override
  bool get salvar {
    _$salvarAtom.reportRead();
    return super.salvar;
  }

  @override
  set salvar(bool value) {
    _$salvarAtom.reportWrite(value, super.salvar, () {
      super.salvar = value;
    });
  }

  final _$initSpeechStateAsyncAction =
      AsyncAction('_SpeechBase.initSpeechState');

  @override
  Future<void> initSpeechState() {
    return _$initSpeechStateAsyncAction.run(() => super.initSpeechState());
  }

  final _$_SpeechBaseActionController = ActionController(name: '_SpeechBase');

  @override
  void startListening() {
    final _$actionInfo = _$_SpeechBaseActionController.startAction(
        name: '_SpeechBase.startListening');
    try {
      return super.startListening();
    } finally {
      _$_SpeechBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopListening() {
    final _$actionInfo = _$_SpeechBaseActionController.startAction(
        name: '_SpeechBase.stopListening');
    try {
      return super.stopListening();
    } finally {
      _$_SpeechBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resultListener(SpeechRecognitionResult result) {
    final _$actionInfo = _$_SpeechBaseActionController.startAction(
        name: '_SpeechBase.resultListener');
    try {
      return super.resultListener(result);
    } finally {
      _$_SpeechBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void soundLevelListener(double level) {
    final _$actionInfo = _$_SpeechBaseActionController.startAction(
        name: '_SpeechBase.soundLevelListener');
    try {
      return super.soundLevelListener(level);
    } finally {
      _$_SpeechBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void errorListener(SpeechRecognitionError error) {
    final _$actionInfo = _$_SpeechBaseActionController.startAction(
        name: '_SpeechBase.errorListener');
    try {
      return super.errorListener(error);
    } finally {
      _$_SpeechBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void statusListener(String status) {
    final _$actionInfo = _$_SpeechBaseActionController.startAction(
        name: '_SpeechBase.statusListener');
    try {
      return super.statusListener(status);
    } finally {
      _$_SpeechBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
level: ${level},
lastWords: ${lastWords},
lastError: ${lastError},
lastStatus: ${lastStatus},
speech: ${speech},
salvar: ${salvar}
    ''';
  }
}
