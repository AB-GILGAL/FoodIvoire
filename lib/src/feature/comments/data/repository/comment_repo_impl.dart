import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/feature/comments/data/api/api_service.dart';
import 'package:foodivoire/src/feature/comments/domain/repository/comment_repository.dart';

import 'package:foodivoire/src/shared/errors/exception.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';

class CommentRepoImpl implements CommentRepository {
  final CommentApiService api;

  CommentRepoImpl(this.api);
 

  @override
  Future<Either<Failure, String>> customerComment (
      String comment, int restaurantId) async {
    try {
     await api.customerComment(comment, restaurantId);
      return  const Right('Done');
    } on CustomException catch (error) {
      return Left(Failure(error.message));
      
    } on SocketException {
      return Left(Failure('You are offline. Check your network.'));
    } catch (e) {
      return Left(Failure('$e'));
    }
  }

}
