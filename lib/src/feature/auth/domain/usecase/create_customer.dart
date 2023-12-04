import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/feature/auth/domain/repository/auth_repository.dart';
import 'package:foodivoire/src/feature/auth/domain/utilities/user_model.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';
import 'package:foodivoire/src/shared/utils/usecase.dart';

class CreateCustomer implements UseCase<String, Param<User>> {
  final AuthRepository repo;
  CreateCustomer(this.repo);

  @override
  Future<Either<Failure, String>> call(Param<User> param) async {
    return await repo.createCustomer(param.data);
  }
}
