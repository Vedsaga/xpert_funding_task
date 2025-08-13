// lib/modules/accounts/logic/bloc/account_bloc.dart

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:xpert_funding_task/modules/modules.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc({required AccountRepository accountRepository})
      : _accountRepository = accountRepository,
        super(const AccountInitial()) {
    on<FetchAccountsEvent>(_onFetchAccounts);
  }
  final AccountRepository _accountRepository;

  Future<void> _onFetchAccounts(
    FetchAccountsEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(const AccountLoading());
    final result = await _accountRepository.fetchAccounts();
    result.fold(
      (failure) => emit(const AccountError('Failed to fetch accounts.')),
      (accounts) => emit(AccountLoaded(accounts)),
    );
  }
}
