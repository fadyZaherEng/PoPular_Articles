import 'package:dartz/dartz.dart';
import 'package:most_popular_articales/data/network/failure.dart';
import 'package:most_popular_articales/domain/models/most_poplar_articles_response/PopularArticlesResponse.dart';

abstract class Repository {
  Future<Either<Failure, PopularArticlesResponse>> getHomeData();
}
