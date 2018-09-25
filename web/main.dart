import 'dart:async';
import 'dart:html';

void main() {
  querySelector('#output').text = 'Your Dart worrrk app is running.';


  print('loading worker');
  //var w = Worker('excel_reader.dart.js');
  var w = Worker('out.js');
  w.onMessage.listen((msg) => print('master say ${msg.data}'));
  
  const oneSec = const Duration(seconds:1);
  new Timer.periodic(oneSec, (Timer t) {
    print('poking worker $w');
    w.postMessage("work!");
  });
}
