import 'package:dartz/dartz.dart';
import 'package:most_popular_articales/data/network/failure.dart';
import 'package:most_popular_articales/domain/models/most_poplar_articles_response/PopularArticlesResponse.dart';
import 'package:most_popular_articales/domain/repository/repository.dart';
import 'package:most_popular_articales/domain/usecase/base_usecase.dart';
//debendency injection principles
class HomeUseCase implements BaseUseCase<void, PopularArticlesResponse> {
  final Repository _repository;
  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, PopularArticlesResponse>> execute(void input) async {
    return await _repository.getHomeData();
  }
}
