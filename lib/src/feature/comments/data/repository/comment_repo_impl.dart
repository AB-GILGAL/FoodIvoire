import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/feature/comments/data/api/api_menu_service.dart';
import 'package:foodivoire/src/feature/comments/data/api/api_service.dart';
import 'package:foodivoire/src/feature/comments/domain/repository/comment_repository.dart';

import 'package:foodivoire/src/shared/errors/exception.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';

import '../../../Vendors/domain/entities/vendor_model.dart';

class CommentRepoImpl implements CommentRepository {
  final CommentApiService api;

  CommentRepoImpl(this.api);
 

  @override
  Future<Either<Failure, Comment>> customerComment (
      String comment, int restaurantId) async {
    try {
    final comMent = await api.customerComment(comment, restaurantId);
      return   Right(comMent);
    } on CustomException catch (error) {
      return Left(Failure(error.message));
      
    } on SocketException {
      return Left(Failure('You are offline. Check your network.'));
    } catch (e) {
      return Left(Failure('$e'));
    }
  }

}

class MenuCommentRepoImpl implements MenuCommentRepository {
  final MenuCommentApiService api;

  MenuCommentRepoImpl(this.api);
 

  @override
  Future<Either<Failure, Comment>> customerMenuComment (
      String comment, int menuId) async {
    try {
    final comMent = await api.customerMenuComment(comment, menuId);
      return   Right(comMent);
    } on CustomException catch (error) {
      return Left(Failure(error.message));
      
    } on SocketException {
      return Left(Failure('You are offline. Check your network.'));
    } catch (e) {
      return Left(Failure('$e'));
    }
  }

}
