// test/modules/accounts/logic/bloc/account_bloc_test.dart

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xpert_funding_task/modules/modules.dart';

class MockAccountRepository extends Mock implements AccountRepository {}

void main() {
  late MockAccountRepository mockAccountRepository;
  late AccountBloc accountBloc;

  final tAccountList = [
    AccountModel(
      id: '1',
      createdAt: DateTime.now(),
      balance: 1000,
      equity: 1000,
      accountName: 'Test Account',
      currentPhase: 1,
      numPhases: 2,
      size: 10000,
      active: true,
      isProAccount: false,
    ),
  ];

  setUp(() {
    mockAccountRepository = MockAccountRepository();
    accountBloc = AccountBloc(accountRepository: mockAccountRepository);
  });

  test('initial state should be AccountInitial', () {
    expect(accountBloc.state, equals(const AccountInitial()));
  });

  group('FetchAccountsEvent', () {
    blocTest<AccountBloc, AccountState>(
      'emits [AccountLoading, AccountLoaded] when fetchAccounts is successful',
      setUp: () {
        when(() => mockAccountRepository.fetchAccounts())
            .thenAnswer((_) async => Right(tAccountList));
      },
      build: () => accountBloc,
      act: (bloc) => bloc.add(const FetchAccountsEvent()),
      expect: () => [
        const AccountLoading(),
        AccountLoaded(tAccountList),
      ],
      verify: (_) {
        verify(() => mockAccountRepository.fetchAccounts()).called(1);
      },
    );

    blocTest<AccountBloc, AccountState>(
      'emits [AccountLoading, AccountError] when fetchAccounts fails',
      setUp: () {
        when(() => mockAccountRepository.fetchAccounts())
            .thenAnswer((_) async => Left(ServerFailure()));
      },
      build: () => accountBloc,
      act: (bloc) => bloc.add(const FetchAccountsEvent()),
      expect: () => [
        const AccountLoading(),
        const AccountError('Failed to fetch accounts.'),
      ],
      verify: (_) {
        verify(() => mockAccountRepository.fetchAccounts()).called(1);
      },
    );
  });
}
