// test/modules/accounts/data/repositories/account_repository_impl_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xpert_funding_task/modules/modules.dart';

class MockAccountRemoteDataSource extends Mock
    implements AccountRemoteDataSource {}

void main() {
  late AccountRepository repository;
  late MockAccountRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockAccountRemoteDataSource();
    repository = AccountRepository(remoteDataSource: mockRemoteDataSource);
  });

  final tAccountModelList = [
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

  group('fetchAccounts', () {
    test(
      '''should return a list of AccountModel when the call to the remote data source is successful''',
      () async {
        when(() => mockRemoteDataSource.fetchAccounts())
            .thenAnswer((_) async => tAccountModelList);

        final result = await repository.fetchAccounts();

        expect(
          result,
          equals(Right<Failure, List<AccountModel>>(tAccountModelList)),
        );

        verify(() => mockRemoteDataSource.fetchAccounts()).called(1);
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );

    test(
      '''should return a ServerFailure when the call to the remote data source is unsuccessful''',
      () async {
        when(() => mockRemoteDataSource.fetchAccounts())
            .thenThrow(Exception('Server error'));

        final result = await repository.fetchAccounts();

        expect(
          result,
          equals(Left<Failure, List<AccountModel>>(ServerFailure())),
        );

        verify(() => mockRemoteDataSource.fetchAccounts()).called(1);
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );
  });
}
