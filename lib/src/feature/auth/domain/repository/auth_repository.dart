import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/feature/auth/domain/utilities/user_model.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> requestOTP(String telephone);
  Future<Either<Failure, bool>> loginCustomer(String telephone,String otp);
  Future<Either<Failure, String>> createCustomer(User user);
}
