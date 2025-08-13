import 'package:fpdart/fpdart.dart';
import 'package:xpert_funding_task/modules/modules.dart';

class AccountRepository {
  const AccountRepository({
    required this.remoteDataSource,
  });
  final AccountRemoteDataSource remoteDataSource;

  Future<Either<Failure, List<AccountModel>>> fetchAccounts() async {
    try {
      final accounts = await remoteDataSource.fetchAccounts();
      return Right(accounts);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
