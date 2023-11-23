import 'package:foodivoire/main.dart';
import 'package:foodivoire/src/feature/menu/data/api/api_service.dart';
import 'package:foodivoire/src/feature/menu/data/repository/menu_repo_impl.dart';
import 'package:foodivoire/src/feature/menu/domain/usecase/fetch_menu.dart';
import 'package:foodivoire/src/feature/menu/presentation/provider/menu_provider.dart';

injectMenuDependencies() {
  getIt.registerLazySingleton<MenuApiService>(() => MenuApiService());
  getIt.registerLazySingleton<MenuRepoImpl>(
      () => MenuRepoImpl(getIt<MenuApiService>()));
  getIt.registerLazySingleton<FetchMenus>(
      () => FetchMenus(getIt<MenuRepoImpl>()));

        getIt.registerLazySingleton<MenuProvider>(()=>menuProvider);

}
final menuProvider = MenuProvider(fetchMenus: getIt<FetchMenus>(),);