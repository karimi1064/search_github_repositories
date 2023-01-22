// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search_github_repositories/src/constants/string_constants.dart';
import 'package:search_github_repositories/src/my_app.dart';

void main() {
  testWidgets(
    "MyApp has a title",
    (tester) async {
      await tester.pumpWidget(const MyApp());

      // verify the title appears exactly once in the widget tree.
      expect(find.text(appBarTitle), findsOneWidget);
    },
  );

  testWidgets('finds a widget using a Key', (tester) async {
    // Define the test key.
    const testKey = Key('K');

    // Build MyApp with the testKey.
    await tester.pumpWidget(const MyApp(key: testKey));

    // Find the MaterialApp widget using the testKey.
    expect(find.byKey(testKey), findsOneWidget);
  });

}
