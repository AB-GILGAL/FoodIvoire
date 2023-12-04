import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/feature/likes/data/api/api_service.dart';
import 'package:foodivoire/src/feature/likes/domain/repository/likes_repository.dart';
import 'package:foodivoire/src/shared/errors/exception.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';

class LikesRepoImpl implements LikesRepository {
  final LikesApiService api;

  LikesRepoImpl(this.api);
 

  @override
  Future<Either<Failure, String>> customerLikes (menuId) async {
    try {
     await api.customerLikes(menuId);
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
