import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/feature/menu/domain/entities/menu_model.dart';
import 'package:foodivoire/src/feature/menu/domain/repository/suggested_menu_repo.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';
import 'package:foodivoire/src/shared/utils/usecase.dart';

class FetchSuggestedMenus extends UseCase<List<MenuDataModel>, NoParams> {
  final SuggestedMenuRepo repo;

  FetchSuggestedMenus(this.repo);

  @override
  Future<Either<Failure, List<MenuDataModel>>> call(
      NoParams params) async {
    return await repo.fetchSuggestedMenus();
  }
}
