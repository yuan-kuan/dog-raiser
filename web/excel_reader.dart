import 'dart:html';

import 'package:js/js.dart';

@JS('postMessage')
external void PostMessage(obj);

@JS('onmessage')
external void set onMessage(f);

void main() {
  onMessage = allowInterop((event) {
    print('worker : ${(event as MessageEvent).data}');
    PostMessage('dont do it!');
  });
}

