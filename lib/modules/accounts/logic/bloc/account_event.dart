part of 'account_bloc.dart';

sealed class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

final class FetchAccountsEvent extends AccountEvent {
  const FetchAccountsEvent();
}
