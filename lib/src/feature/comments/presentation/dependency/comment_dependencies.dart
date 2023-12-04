import 'package:foodivoire/main.dart';
import 'package:foodivoire/src/feature/comments/data/api/api_service.dart';
import 'package:foodivoire/src/feature/comments/data/repository/comment_repo_impl.dart';
import 'package:foodivoire/src/feature/comments/domain/usecase/comment.dart';
import 'package:foodivoire/src/feature/comments/presentation/provider/comment_provider.dart';


injectCommentDependencies() {
  getIt.registerLazySingleton<CommentApiService>(
    () => CommentApiService(),
  );
  getIt.registerLazySingleton<CommentRepoImpl>(
    () => CommentRepoImpl(getIt<CommentApiService>()),
  );
  getIt.registerLazySingleton<CustomerComment>(
    () => CustomerComment(getIt<CommentRepoImpl>()),
  );
}

final commentProvider = CommentProvider(
  comment: getIt<CustomerComment>(),

);
