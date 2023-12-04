import 'package:foodivoire/main.dart';

import 'package:foodivoire/src/feature/menu/data/api/popular_menu_api_service.dart';
import 'package:foodivoire/src/feature/menu/data/repository/popular_menu_repo_impl.dart';
import 'package:foodivoire/src/feature/menu/domain/usecase/fetch_popular_menu.dart';
import 'package:foodivoire/src/feature/menu/presentation/provider/popular_menu_provider.dart';

injectPopularMenuDependencies() {
  getIt.registerLazySingleton<PopularMenuApiService>(() => PopularMenuApiService());
  getIt.registerLazySingleton<PopularMenuRepoImpl>(
      () => PopularMenuRepoImpl(getIt<PopularMenuApiService>()));
  getIt.registerLazySingleton<FetchPopularMenus>(
      () => FetchPopularMenus(getIt<PopularMenuRepoImpl>()));

        getIt.registerLazySingleton<PopularMenuProvider>(()=>popularMenuProvider);

}
final popularMenuProvider = PopularMenuProvider(fetchPopularMenus: getIt<FetchPopularMenus>(),);