import 'dart:async';
//import 'dart:html' hide Worker, MessageEvent;

import 'package:js/js.dart';

import 'package:excel_worker/alt_worker.dart';
import 'package:excel_worker/dog.dart';


@anonymous
@JS()
abstract class MessageEvent {
  external dynamic get data;
}

void main() {
  //querySelector('#output').text = 'Your Dart worrrk app is running.';

  const oneSec = const Duration(seconds:1);
 
  var w = AltWorker('out.js');
  //var w = newWorker('out.js');
  w.onmessage = allowInterop((msg) {
    //var e = msg as MessageEvent;
    print('master got weird shit ${msg.data}');
    var dog = msg.data as Dog;
    print('master took back ${dog.name} and it turns into ${dog.age}!');
  });

  //print(stringify(oneSec));
  
  new Timer(oneSec, () {
    var dog = Dog(name : 'Marley', age: 2);
    w.postMessage(dog);
  });
  
}
