import 'dart:async';
import 'dart:html';

void main() {
  querySelector('#output').text = 'Your Dart worrrk app is running.';

  const oneSec = const Duration(seconds:1);
  //var w = Worker('excel_reader.dart.js');
  var w = Worker('out.js');
  w.onMessage.listen((msg) => print('master say ${msg.data}'));
  
  new Timer(oneSec, () {
    print('poking worker $w');
    w.postMessage("work!");
  });
  
}
