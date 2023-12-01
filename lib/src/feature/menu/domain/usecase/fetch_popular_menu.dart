import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/feature/menu/domain/entities/popular_menu_model.dart';
import 'package:foodivoire/src/feature/menu/domain/repository/popular_menu_repo.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';
import 'package:foodivoire/src/shared/utils/usecase.dart';

class FetchPopularMenus extends UseCase<List<PopularMenuDataModel>, NoParams> {
  final PopularMenuRepo repo;

  FetchPopularMenus(this.repo);

  @override
  Future<Either<Failure, List<PopularMenuDataModel>>> call(
      NoParams params) async {
    return await repo.fetchPopularMenus();
  }
}
