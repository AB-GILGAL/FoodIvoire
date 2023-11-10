import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/feature/auth/data/api/api_service.dart';
import 'package:foodivoire/src/feature/auth/domain/repository/auth_repository.dart';
import 'package:foodivoire/src/shared/errors/exception.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';

class AuthRepoImpl implements AuthRepository{
  final AuthApiService  api;

  AuthRepoImpl(this.api);
  @override
  Future<Either<Failure, String>> requestOTP(String telephone)async {
    try {
       await api.requestOTP(telephone);
      return Right('OTP code will be sent to $telephone');
    } on CustomException catch (error) {
      return Left(Failure(error.message));
    } on SocketException {
      return Left(Failure('You are offline. Check your network.'));
    } catch (e) {
      return Left(Failure('$e'));
    }
  }

  @override
  Future<Either<Failure, String>> verifyOTP(String otp) async{
     try {
       await api.verifyOTP(otp);
      return const Right('OTP verified');
    } on CustomException catch (error) {
      return Left(Failure(error.message));
    } on SocketException {
      return Left(Failure('You are offline. Check your network.'));
    } catch (e) {
      return Left(Failure('$e'));
    }
  }

}