import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';

abstract class AuthRepository{
  Future<Either<Failure,String>> requestOTP(String telephone);
  Future<Either<Failure,String>> verifyOTP(String otp);
}