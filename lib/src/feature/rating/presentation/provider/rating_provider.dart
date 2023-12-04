import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/rating/domain/usecase/rating.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';
import 'package:foodivoire/src/shared/utils/usecase.dart';

class RatingProvider extends ChangeNotifier {
  final CustomerRating _customerRating;

  RatingProvider({

    required CustomerRating rating,
  })  : _customerRating = rating;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _userName = '';
  get username => _userName;
  setUserName(String userName) {
    _userName = userName;
    notifyListeners();
  }

  Future<Either<Failure, String>> customerRating(
      int scale, int restaurantId) async {
    _isLoading = true;
    notifyListeners();
    final result = await _customerRating(MultiParams(scale, restaurantId));
    return result.fold((failure) {
      _isLoading = false;
      notifyListeners();
      return Left(Failure(failure.message));
    }, (success) async {
      _isLoading = false;
      notifyListeners();
      return Right(success);
    });
  }

}
