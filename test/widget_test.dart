import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lander/main.dart';

void main() {
  testWidgets('App launches and shows splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(const LanderApp());

    // Splash screen should show the app name and tagline immediately.
    expect(find.text('LANDER'), findsOneWidget);
    expect(find.text('Learn. Connect. Work. Grow.'), findsOneWidget);
    expect(find.text('Powered by Parm'), findsOneWidget);
  });
}
