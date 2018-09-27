@JS()
library alt_workers;

import 'package:js/js.dart';

@JS('Worker')
class AltWorker {
  external factory AltWorker(String aURL);
  external set onmessage(f);
  external void postMessage(obj);
}


@JS("JSON.stringify")
external String stringify(obj);