import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/auth/domain/usecase/request_otp.dart';
import 'package:foodivoire/src/feature/auth/domain/usecase/verify_otp.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';
import 'package:foodivoire/src/shared/utils/usecase.dart';

class AuthProvider extends ChangeNotifier {
  final RequestOTP _requestOTP;
  final VerifyOTP _verifyOTP;

  AuthProvider({required RequestOTP requestOTP, required VerifyOTP verifyOTP})
      : _requestOTP = requestOTP,
        _verifyOTP = verifyOTP;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<Either<Failure, String>> requestOTP(String telephone) async {
    final result = await _requestOTP(Param(telephone));

    return result.fold((failure) {
      _isLoading = false;
      notifyListeners();
      return Left(Failure(failure.message));
    }, (success) async {
      _isLoading = false;
      print(success);
      // await setUserId(success);
      notifyListeners();
      return Right(success);
    });
  }

  Future<Either<Failure,String>> verifyOTP(String otp)async{
    final result = await _verifyOTP(Param(otp));

    return result.fold((failure) {
      _isLoading = false;
      notifyListeners();
      return Left(Failure(failure.message));
    }, (success) async {
      _isLoading = false;
      print(success);
      // await setUserId(success);
      notifyListeners();
      return Right(success);
    });
  }
}
