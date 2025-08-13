part of 'account_bloc.dart';

sealed class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object> get props => [];
}

final class AccountInitial extends AccountState {
  const AccountInitial();
}

final class AccountLoading extends AccountState {
  const AccountLoading();
}

final class AccountLoaded extends AccountState {
  const AccountLoaded(this.accounts);
  final List<AccountModel> accounts;

  @override
  List<Object> get props => [accounts];
}

final class AccountError extends AccountState {
  const AccountError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
