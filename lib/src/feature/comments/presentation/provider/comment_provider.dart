import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/Vendors/domain/entities/vendor_model.dart';
import 'package:foodivoire/src/feature/comments/domain/usecase/comment.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';
import 'package:foodivoire/src/shared/utils/usecase.dart';

class CommentProvider extends ChangeNotifier {
  final CustomerComment _customerComment;

  CommentProvider({

    required CustomerComment comment,
  })  : _customerComment = comment;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _userName = '';
  get username => _userName;
  setUserName(String userName) {
    _userName = userName;
    notifyListeners();
  }

  Future<Either<Failure, Comment>> customerComment(
      String comment, int restaurantId) async {
    _isLoading = true;
    notifyListeners();
    final result = await _customerComment(MultiParams(comment, restaurantId));
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
