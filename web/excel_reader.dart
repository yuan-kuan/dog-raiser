import 'dart:html';
import 'dart:async';

import 'package:js/js.dart';
import 'package:js/js_util.dart' as js_util;

@anonymous
@JS()
abstract class DedicatedWorkerGlobalScope {
}

@JS('self')
external dynamic get globalScopeSelf;

@JS('postMessage')
external void PostMessage(obj);

void main() {
  print("excel reading hard at work $globalScopeSelf and $PostMessage");
  
  var controller = new StreamController.broadcast(sync: true);
  print(controller.stream);

  const oneSec = const Duration(seconds:1);
  new Timer(oneSec, () {
    js_util.setProperty(globalScopeSelf, 'onmessage', allowInterop((event) {
      var e = event as MessageEvent;
      print('controller : data? ${e.data}');
      PostMessage('dont do it!');
    }));
  });


  //controller.stream.first;
}

