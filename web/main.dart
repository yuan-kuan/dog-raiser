import 'dart:async';
import 'dart:html';

import 'package:js/js.dart';

import 'package:excel_worker/dog.dart';


void main() {
  querySelector('#output').text = 'Your Dart worrrk app is running.';

  const oneSec = const Duration(seconds:1);

  var w = Worker('out.js');
  w.onMessage.listen((msg) {
    print('master got weird shit ${msg.data}');
    var dog = msg.data as Dog;
    print('master took back ${dog.name} and it turns into ${dog.age}!');
  });
  
  new Timer(oneSec, () {
    var dog = Dog(name : 'Marley', age: 2);
    w.postMessage(dog);
  });
  
}
