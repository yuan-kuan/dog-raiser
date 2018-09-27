@JS()
library dogs;

import 'package:js/js.dart';

@JS()
@anonymous
class Dog {
  external String get name;
  external int get age;

  external factory Dog({String name, int age});
}