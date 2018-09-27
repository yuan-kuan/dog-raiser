import 'package:js/js.dart';

import 'package:excel_worker/dog.dart';

@anonymous
@JS()
abstract class MessageEvent {
  external dynamic get data;
}

@JS('postMessage')
external void PostMessage(obj);

@JS('onmessage')
external void set onMessage(f);

@JS("JSON.stringify")
external String stringify(obj);

void main() {
  print('Worker created');
  
  onMessage = allowInterop((event) {
    var e = event as MessageEvent;
    print('worker got ${stringify(e.data)}');
    var dog = e.data as Dog;
    print('worker: got ${dog.name} from master, raising it from ${dog.age}...');

    var olderDog = Dog(name : '${dog.name} 2.0', age: dog.age + 1);
    PostMessage(olderDog);
  });
}

