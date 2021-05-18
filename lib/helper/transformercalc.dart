import 'dart:async';

final plus =  StreamTransformer<int, int>.fromHandlers(
  handleData: (int value, Sink sink){
     value = value * 2;
     sink.add(value);
  }
);

