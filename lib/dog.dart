@JS()
library dogs;

import 'package:js/js.dart';

@JS()
@anonymous
class Dog {
  external String get name;
  external int get age;

  external factory Dog({String name, int age});

  //external String ToString() => '$name is $age years old';

  // Dog.fromJson(Map<String, dynamic> json)
  //   : name = json['name'], age = json['age'];

  // Map<String, dynamic> toJson() =>
  //   {'name':name, 'age':age};
}