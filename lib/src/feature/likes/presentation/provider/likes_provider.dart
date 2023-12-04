import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/likes/domain/usecase/likes.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';
import 'package:foodivoire/src/shared/utils/usecase.dart';

class LikesProvider extends ChangeNotifier {
  final CustomerLikes _customerLikes;

  LikesProvider({

    required CustomerLikes likes,
  })  : _customerLikes = likes;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _userName = '';
  get username => _userName;
  setUserName(String userName) {
    _userName = userName;
    notifyListeners();
  }

  Future<Either<Failure, String>> customerLikes(
      int menuId) async {
    _isLoading = true;
    notifyListeners();
    final result = await _customerLikes(Param(menuId));
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
