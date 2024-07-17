import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:testing_tugas/screen/login_screen.dart';
import 'package:testing_tugas/screen/navigation_screen.dart';

void main() {
  testWidgets("Halaman Login (Test Widget)", (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );

    /// mencari textfield dengan key username_field
    Finder usernameTextField = find.byKey(const ValueKey("username_field"));
    expect(usernameTextField, findsOneWidget);

    /// mencari textfield dengan key password_field
    expect(find.byKey(const ValueKey("password_field")), findsOneWidget);

    await tester.tap(find.byType(ElevatedButton));
  });

  testWidgets("Halaman Utama (Test Navigasi)", (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: NavigationScreen(),
      ),
    );

    /// menguji tombol kemudian berpindah halaman dan mencari text
    await tester.tap(find.byType(ElevatedButton)); // mencari ElevatedButton
    await tester.pumpAndSettle(); // rebuild tampilan karena perubahan state
    expect(find.text("Halaman Kedua"),
        findsOneWidget); // verifikasi apakah ada text "" di halaman tersebut
  });
}
