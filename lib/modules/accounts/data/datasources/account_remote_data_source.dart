import 'dart:convert';
import 'package:xpert_funding_task/modules/modules.dart';

class AccountRemoteDataSource {
  Future<List<AccountModel>> fetchAccounts() async {
    await Future<void>.delayed(const Duration(seconds: 1));

    final decodedJson = json.decode(_MockAccountRemoteDataSource.dummyResponse)
        as List<dynamic>;

    return decodedJson
        .map((json) => AccountModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}

class _MockAccountRemoteDataSource {
  // The dummy JSON data.
  static const String dummyResponse = '''
    [
      {
        "id": "12345FUND",
        "createdAt": "2025-03-22T10:00:00Z",
        "balance": 86340.50,
        "equity": 88000.00,
        "accountName": "Two Step Challenge",
        "currentPhase": 0,
        "numPhases": 2,
        "size": 25000,
        "active": true,
        "isProAccount": true
      },
      {
        "id": "12345EVAL1",
        "createdAt": "2025-03-20T11:30:00Z",
        "balance": 56340.00,
        "equity": 57000.00,
        "accountName": "Two Step Challenge",
        "currentPhase": 1,
        "numPhases": 2,
        "size": 5000,
        "active": true,
        "isProAccount": true
      },
      {
        "id": "12345EVAL2",
        "createdAt": "2025-03-21T09:45:00Z",
        "balance": 96340.00,
        "equity": 98000.00,
        "accountName": "Two Step Challenge",
        "currentPhase": 2,
        "numPhases": 2,
        "size": 10000,
        "active": true,
        "isProAccount": false
      }
    ]
    ''';
}
