import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/feature/auth/domain/repository/auth_repository.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';
import 'package:foodivoire/src/shared/utils/usecase.dart';

class LoginCustomer
    implements UseCase<bool, MultiParams<String, String, String>> {
  final AuthRepository repo;
  LoginCustomer(this.repo);

  @override
  Future<Either<Failure, bool>> call(
      MultiParams<String, String, String> param) async {
    return await repo.loginCustomer(param.data1, param.data2);
  }
}
