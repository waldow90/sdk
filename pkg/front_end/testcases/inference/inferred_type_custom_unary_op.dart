// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/*@testedFeatures=inference*/
library test;

class C {
  bool operator -() => true;
}

C c = new C();
var x = /*@target=C::unary-*/ -c;

main() {
  c;
  x;
}
