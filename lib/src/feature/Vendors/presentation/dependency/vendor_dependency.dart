import 'package:foodivoire/main.dart';
import 'package:foodivoire/src/feature/Vendors/data/api/api_service.dart';
import 'package:foodivoire/src/feature/Vendors/data/repository/vendor_repo_impl.dart';
import 'package:foodivoire/src/feature/Vendors/domain/usecase/fetch_vendor.dart';
import 'package:foodivoire/src/feature/Vendors/presentation/provider/vendor_provider.dart';

injectRestaurantDependencies() {
  getIt.registerLazySingleton<RestaurantApiService>(() => RestaurantApiService());
  getIt.registerLazySingleton<RestaurantRepoImpl>(
      () => RestaurantRepoImpl(getIt<RestaurantApiService>()));
  getIt.registerLazySingleton<FetchRestaurants>(
      () => FetchRestaurants(getIt<RestaurantRepoImpl>()));

        getIt.registerLazySingleton<RestaurantProvider>(()=>restaurantProvider);

}
final restaurantProvider = RestaurantProvider(fetchRestaurants: getIt<FetchRestaurants>(),);