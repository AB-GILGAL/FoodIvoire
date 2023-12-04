import 'package:foodivoire/main.dart';
import 'package:foodivoire/src/feature/menu/data/api/suggested_menu_api_service.dart';
import 'package:foodivoire/src/feature/menu/data/repository/suggested_menu_repo_impl.dart';
import 'package:foodivoire/src/feature/menu/domain/usecase/fetch_suggested_menu.dart';
import 'package:foodivoire/src/feature/menu/presentation/provider/suggested_menu_provider.dart';

injectSuggestedMenuDependencies() {
  getIt.registerLazySingleton<SuggestedMenuApiService>(() => SuggestedMenuApiService());
  getIt.registerLazySingleton<SuggestedMenuRepoImpl>(
      () => SuggestedMenuRepoImpl(getIt<SuggestedMenuApiService>()));
  getIt.registerLazySingleton<FetchSuggestedMenus>(
      () => FetchSuggestedMenus(getIt<SuggestedMenuRepoImpl>()));

        getIt.registerLazySingleton<SuggestedMenuProvider>(()=>suggestedMenuProvider);

}
final suggestedMenuProvider = SuggestedMenuProvider(fetchSuggestedMenus: getIt<FetchSuggestedMenus>(),);