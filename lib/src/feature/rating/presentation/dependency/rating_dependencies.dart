import 'package:foodivoire/main.dart';
import 'package:foodivoire/src/feature/rating/data/api/api_service.dart';
import 'package:foodivoire/src/feature/rating/data/repository/rating_repo_impl.dart';
import 'package:foodivoire/src/feature/rating/domain/usecase/rating.dart';
import 'package:foodivoire/src/feature/rating/presentation/provider/rating_provider.dart';


injectRatingDependencies() {
  getIt.registerLazySingleton<RatingApiService>(
    () => RatingApiService(),
  );
  getIt.registerLazySingleton<RatingRepoImpl>(
    () => RatingRepoImpl(getIt<RatingApiService>()),
  );
  getIt.registerLazySingleton<CustomerRating>(
    () => CustomerRating(getIt<RatingRepoImpl>()),
  );
}

final ratingProvider = RatingProvider(
  rating: getIt<CustomerRating>(),

);
