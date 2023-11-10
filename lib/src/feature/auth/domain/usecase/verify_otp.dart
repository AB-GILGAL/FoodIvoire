import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/feature/auth/domain/repository/auth_repository.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';
import 'package:foodivoire/src/shared/utils/usecase.dart';

class VerifyOTP 
    implements UseCase<String, Param<String>> {
  final AuthRepository repo;
  VerifyOTP(this.repo);

  @override
  Future<Either<Failure, String>> call(Param<String> param) async {
    return await repo.verifyOTP(param.data);
  }
}