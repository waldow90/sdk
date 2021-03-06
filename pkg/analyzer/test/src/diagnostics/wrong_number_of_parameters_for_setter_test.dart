// Copyright (c) 2019, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analyzer/src/error/codes.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

import '../dart/resolution/driver_resolution.dart';

main() {
  defineReflectiveSuite(() {
    defineReflectiveTests(WrongNumberOfParametersForSetterTest);
  });
}

@reflectiveTest
class WrongNumberOfParametersForSetterTest extends DriverResolutionTest {
  test_function_named() async {
    await assertErrorsInCode('''
set x({p}) {}
''', [
      error(CompileTimeErrorCode.WRONG_NUMBER_OF_PARAMETERS_FOR_SETTER, 4, 1),
    ]);
  }

  test_function_optional() async {
    await assertErrorsInCode('''
set x([p]) {}
''', [
      error(CompileTimeErrorCode.WRONG_NUMBER_OF_PARAMETERS_FOR_SETTER, 4, 1),
    ]);
  }

  test_function_tooFew() async {
    await assertErrorsInCode('''
set x() {}
''', [
      error(CompileTimeErrorCode.WRONG_NUMBER_OF_PARAMETERS_FOR_SETTER, 4, 1),
    ]);
  }

  test_function_tooMany() async {
    await assertErrorsInCode('''
set x(a, b) {}
''', [
      error(CompileTimeErrorCode.WRONG_NUMBER_OF_PARAMETERS_FOR_SETTER, 4, 1),
    ]);
  }

  test_method_named() async {
    await assertErrorsInCode(r'''
class A {
  set x({p}) {}
}
''', [
      error(CompileTimeErrorCode.WRONG_NUMBER_OF_PARAMETERS_FOR_SETTER, 16, 1),
    ]);
  }

  test_method_optional() async {
    await assertErrorsInCode(r'''
class A {
  set x([p]) {}
}
''', [
      error(CompileTimeErrorCode.WRONG_NUMBER_OF_PARAMETERS_FOR_SETTER, 16, 1),
    ]);
  }

  test_method_tooFew() async {
    await assertErrorsInCode(r'''
class A {
  set x() {}
}
''', [
      error(CompileTimeErrorCode.WRONG_NUMBER_OF_PARAMETERS_FOR_SETTER, 16, 1),
    ]);
  }

  test_method_tooMany() async {
    await assertErrorsInCode(r'''
class A {
  set x(a, b) {}
}
''', [
      error(CompileTimeErrorCode.WRONG_NUMBER_OF_PARAMETERS_FOR_SETTER, 16, 1),
    ]);
  }
}
