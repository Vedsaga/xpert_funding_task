import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xpert_funding_task/modules/modules.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Inter',
        colorScheme: const ColorScheme.dark(),
      ),
      home: Scaffold(body: child),
    );
  }

  final onChallengeAccount = AccountModel(
    id: 'CHLG123',
    createdAt: DateTime(2025, 3, 20),
    balance: 56340,
    equity: 57000,
    accountName: 'Two Step Challenge',
    currentPhase: 1, // On challenge
    numPhases: 2,
    size: 5000,
    active: true,
    isProAccount: true,
  );

  final fundedAccount = AccountModel(
    id: 'FUND456',
    createdAt: DateTime(2025, 3, 22),
    balance: 86340,
    equity: 88000,
    accountName: 'Funded Account',
    currentPhase: 0,
    numPhases: 2,
    size: 25000,
    active: true,
    isProAccount: false,
  );

  testWidgets('AccountCard displays correct info for an "On Challenge" account',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      makeTestableWidget(child: AccountCard(account: onChallengeAccount)),
    );

    expect(find.text('Two Step Challenge'), findsOneWidget);
    expect(find.text(r'$5,000.00'), findsOneWidget);
    expect(find.text('PRO'), findsOneWidget);
    expect(find.text('On Challenge'), findsOneWidget);
    expect(find.textContaining(r'Balance: $56,340.00'), findsOneWidget);
    expect(find.textContaining('Bought: Mar 20, 2025'), findsOneWidget);
    expect(find.textContaining('ID: CHLG123'), findsOneWidget);
    expect(find.text('Evaluation 1'), findsOneWidget);
    expect(find.text('Dashboard'), findsOneWidget);
  });

  testWidgets('AccountCard displays correct info for a "Funded" account',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      makeTestableWidget(child: AccountCard(account: fundedAccount)),
    );

    expect(find.text('Funded Account'), findsNWidgets(2));

    expect(find.text(r'$25,000.00'), findsOneWidget);
    expect(find.text('PRO'), findsNothing);
    expect(find.text('Funded'), findsOneWidget);
    expect(find.textContaining(r'Balance: $86,340.00'), findsOneWidget);
    expect(find.textContaining('Bought: Mar 22, 2025'), findsOneWidget);
    expect(find.textContaining('ID: FUND456'), findsOneWidget);
    expect(find.text('Dashboard'), findsOneWidget);
  });
}
