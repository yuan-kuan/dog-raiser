import 'dart:async';
import 'dart:html';

import 'package:excel_worker/dog.dart';

void main() {
  var w = Worker('worker/dog_raiser.dart.js');

  w.onMessage.listen((msg) {
    print('master got ${msg.data}');
    var dog = Dog(name: msg.data['name'], age: msg.data['age']);
    print('master took back ${dog.name} and she turns into ${dog.age}!');
  });

  new Timer(Duration(seconds:1), () {
    w.postMessage(Dog(name : 'Marley', age: 1));
  });
  
  querySelector('#output').text = 'Check your console (Ctrl + Shift + i).';
}
