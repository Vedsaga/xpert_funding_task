import 'package:equatable/equatable.dart';

class AccountModel extends Equatable {
  const AccountModel({
    required this.id,
    required this.createdAt,
    required this.balance,
    required this.equity,
    required this.accountName,
    required this.currentPhase,
    required this.numPhases,
    required this.size,
    required this.active,
    required this.isProAccount,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      balance: (json['balance'] as num).toDouble(),
      equity: (json['equity'] as num).toDouble(),
      accountName: json['accountName'] as String,
      currentPhase: json['currentPhase'] as int,
      numPhases: json['numPhases'] as int,
      size: (json['size'] as num).toDouble(),
      active: json['active'] as bool,
      isProAccount: json['isProAccount'] as bool,
    );
  }

  final String id;
  final DateTime createdAt;
  final double balance;
  final double equity;
  final String accountName;
  final int currentPhase; // 0: funded, 1: eval1, 2: eval2
  final int numPhases;
  final double size;
  final bool active;
  final bool isProAccount;

  /// Helper getter to determine if the account is in an evaluation phase.
  bool get isOnChallenge => currentPhase > 0;

  @override
  List<Object?> get props => [
        id,
        createdAt,
        balance,
        equity,
        accountName,
        currentPhase,
        numPhases,
        size,
        active,
        isProAccount,
      ];
}
