import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/auth/domain/usecase/create_customer.dart';
import 'package:foodivoire/src/feature/auth/domain/usecase/request_otp.dart';
import 'package:foodivoire/src/feature/auth/domain/usecase/verify_otp.dart';
import 'package:foodivoire/src/feature/auth/domain/utilities/user_model.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';
import 'package:foodivoire/src/shared/utils/usecase.dart';

class AuthProvider extends ChangeNotifier {
  final RequestOTP _requestOTP;
  final LoginCustomer _loginCustomer;
  final CreateCustomer _createCustomer;

  AuthProvider({
    required RequestOTP requestOTP,
    required LoginCustomer verifyOTP,
    required CreateCustomer createCustomer,
  })  : _requestOTP = requestOTP,
        _loginCustomer = verifyOTP,
        _createCustomer = createCustomer;

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
      notifyListeners();
      return Right(success);
    });
  }

  Future<Either<Failure, bool>> loginCustomer(
      String telephone, String otp) async {
    final result = await _loginCustomer(MultiParams(telephone, otp));

    return result.fold((failure) {
      _isLoading = false;
      notifyListeners();
      return Left(Failure(failure.message));
    }, (success) async {
      _isLoading = false;
      print(success);
      notifyListeners();
      return Right(success);
    });
  }

  Future<Either<Failure, String>> createCustomer(User user) async {
    final result = await _createCustomer(Param(user));

    return result.fold((failure) {
      _isLoading = false;
      notifyListeners();
      return Left(Failure(failure.message));
    }, (success) async {
      _isLoading = false;
      print(success);
      notifyListeners();
      return Right(success);
    });
  }
}
