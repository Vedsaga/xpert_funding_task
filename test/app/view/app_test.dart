// test/app/view/app_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xpert_funding_task/app/app.dart';
import 'package:xpert_funding_task/modules/modules.dart';

void main() {
  group('App', () {
    testWidgets('renders AccountsScreen and displays accounts after loading',
        (tester) async {
      final binding = TestWidgetsFlutterBinding.ensureInitialized();
      await binding.setSurfaceSize(const Size(400, 800));

      await tester.pumpWidget(const App());

      expect(find.byType(AccountsScreen), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pumpAndSettle();

      expect(find.byType(CircularProgressIndicator), findsNothing);

      expect(find.text(r'$25,000.00'), findsOneWidget);
    });
  });
}
