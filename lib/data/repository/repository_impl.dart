import 'package:dartz/dartz.dart';
import 'package:most_popular_articales/app/extension.dart';
import 'package:most_popular_articales/data/data_source/local_data_source.dart';
import 'package:most_popular_articales/data/data_source/remote_data_source.dart';
import 'package:most_popular_articales/data/network/error_handler.dart';
import 'package:most_popular_articales/data/network/failure.dart';
import 'package:most_popular_articales/data/network/network_info.dart';
import 'package:most_popular_articales/domain/models/most_poplar_articles_response/PopularArticlesResponse.dart';
import 'package:most_popular_articales/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;
  RepositoryImpl(this._remoteDataSource, this._networkInfo,this._localDataSource);

  @override
  Future<Either<Failure, PopularArticlesResponse>> getHomeData() async {
    try {
      // get response from cache
      PopularArticlesResponse response = await _localDataSource.getHomeData();
      return Right(response);
    } catch (cacheError) {
      // cache is not existing or cache is not valid
      // its the time to get from API side
      if (await _networkInfo.isConnected) {
        // its connected to internet, its safe to call API
        try {
          final response = await _remoteDataSource.getHomeData();
          PopularArticlesResponse popularArticlesResponse=PopularArticlesResponse.fromJson(response.data);
          if (popularArticlesResponse.status == 'OK') {
            // success
            // return data
            //return either right
            // save response in cache (local data source)
            _localDataSource.saveHomeToCache(popularArticlesResponse);
            return Right(popularArticlesResponse);
          } else {
            // failure --return business error
            // return either left
            return Left(Failure(ApiInternalStatus.FAILURE,
                response.statusMessage ?? ResponseMessage.DEFAULT));
          }
        } catch (error) {
          return Left(ErrorHandler
              .handle(error)
              .failure);
        }
      } else {
        // return internet connection error
        // return either left
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }

}
