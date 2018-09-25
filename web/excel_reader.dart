import 'dart:html';
import 'dart:async';

import 'package:js/js.dart';
import 'package:js/js_util.dart' as js_util;

Stream<T> callbackToStream<J, T>(
    dynamic object, String name, T unwrapValue(J jsValue)) {
  // ignore: close_sinks
  StreamController<T> controller = new StreamController.broadcast(sync: true);
  js_util.setProperty(object, name, allowInterop((J event) {
    controller.add(unwrapValue(event));
  }));
  return controller.stream;
}

typedef void CallbackFn<T>(T value);

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

  callbackToStream(globalScopeSelf, 'onmessage', (j) => j as MessageEvent).listen((e) {
    print('util done it? ${e.data}');
    PostMessage('working on it');
  });
}

