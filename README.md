Purpose: Write the main app and worker code in dart, in the same project.

Progress: The furthest I reach is the ability to write worker code in dart, onmessage and PostMessage worked, able to pass a custom object from main to worker and back. 

Problems:

1. 'webdev serve' will have Worker('worker.dart.js') load the intermediate file Dart2vec used for live reloading instead of the real worker script. There are 2 workaround. 1, use 'dart2js' to compile the worker.dart, put it into web/ during development. 2, use 'webdev serve -r'.

2. dart.html's Worker.onMessage will always massage the return JSObject before passing it through the Stream. I reckon this will waste some CPU cycle and I will not able to cast the MessageEvent.data into the class I wanted directly (this can be done in Worker's code).

Running: 

1, clone this repro.
2, do a 'pub get'
3, then 'webdev serve -r'
