import 'package:flutter_test/flutter_test.dart';
import 'package:codexia/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('SigupServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}