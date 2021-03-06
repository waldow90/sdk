// Copyright (c) 2019, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/src/error/codes.dart';
import 'package:analyzer/src/generated/engine.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

import '../dart/resolution/driver_resolution.dart';

main() {
  defineReflectiveSuite(() {
    defineReflectiveTests(DefaultValueOnRequiredParameterTest);
  });
}

@reflectiveTest
class DefaultValueOnRequiredParameterTest extends DriverResolutionTest {
  @override
  AnalysisOptionsImpl get analysisOptions => AnalysisOptionsImpl()
    ..contextFeatures = FeatureSet.forTesting(
        sdkVersion: '2.3.0', additionalFeatures: [Feature.non_nullable]);

  test_notRequired_default() async {
    await assertNoErrorsInCode('''
void log({String message: 'no message'}) {}
''');
  }

  test_notRequired_noDefault() async {
    await assertNoErrorsInCode('''
void log({String? message}) {}
''');
  }

  test_required_default() async {
    await assertErrorsInCode('''
void log({required String? message: 'no message'}) {}
''', [
      error(CompileTimeErrorCode.DEFAULT_VALUE_ON_REQUIRED_PARAMETER, 27, 7),
    ]);
  }

  test_required_noDefault() async {
    await assertNoErrorsInCode('''
void log({required String message}) {}
''');
  }
}
