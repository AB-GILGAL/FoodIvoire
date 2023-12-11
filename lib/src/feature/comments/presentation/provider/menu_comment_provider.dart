import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/Vendors/domain/entities/vendor_model.dart';
import 'package:foodivoire/src/feature/comments/domain/usecase/comment.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';
import 'package:foodivoire/src/shared/utils/usecase.dart';

class MenuCommentProvider extends ChangeNotifier {
  final CustomerMenuComment _customerMenuComment;

  MenuCommentProvider({

    required CustomerMenuComment comment,
  })  : _customerMenuComment = comment;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _userName = '';
  get username => _userName;
  setUserName(String userName) {
    _userName = userName;
    notifyListeners();
  }

  Future<Either<Failure, Comment>> customerMenuComment(
      String comment, int menuId) async {
    _isLoading = true;
    notifyListeners();
    final result = await _customerMenuComment(MultiParams(comment, menuId));
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
