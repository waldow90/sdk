// Copyright (c) 2014, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:test_reflective_loader/test_reflective_loader.dart';

import 'computer/test_all.dart' as computer;
import 'domain_abstract_test.dart' as domain_abstract;
import 'domains/test_all.dart' as domains;
import 'edit/test_all.dart' as edit;
import 'flutter/test_all.dart' as flutter;
import 'lsp/test_all.dart' as lsp;
import 'plugin/test_all.dart' as plugin;
import 'services/test_all.dart' as services;
import 'utilities/test_all.dart' as utilities;

/**
 * Utility for manually running all tests.
 */
main() {
  defineReflectiveSuite(() {
    computer.main();
    domain_abstract.main();
    domains.main();
    edit.main();
    flutter.main();
    lsp.main();
    plugin.main();
    services.main();
    utilities.main();
  }, name: 'src');
}
