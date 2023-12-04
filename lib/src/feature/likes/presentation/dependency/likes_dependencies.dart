import 'package:foodivoire/main.dart';
import 'package:foodivoire/src/feature/likes/data/api/api_service.dart';
import 'package:foodivoire/src/feature/likes/data/repository/likes_repo_impl.dart';
import 'package:foodivoire/src/feature/likes/domain/usecase/likes.dart';
import 'package:foodivoire/src/feature/likes/presentation/provider/likes_provider.dart';


injectLikesDependencies() {
  getIt.registerLazySingleton<LikesApiService>(
    () => LikesApiService(),
  );
  getIt.registerLazySingleton<LikesRepoImpl>(
    () => LikesRepoImpl(getIt<LikesApiService>()),
  );
  getIt.registerLazySingleton<CustomerLikes>(
    () => CustomerLikes(getIt<LikesRepoImpl>()),
  );
}

final likesProvider = LikesProvider(
  likes: getIt<CustomerLikes>(),

);
