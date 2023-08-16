import 'package:dio/dio.dart';
import 'package:most_popular_articales/app/constants.dart';
import 'package:most_popular_articales/data/network/app_api.dart';
import 'package:most_popular_articales/domain/models/most_poplar_articles_response/PopularArticlesResponse.dart';

abstract class RemoteDataSource {
  Future<PopularArticlesResponse> getHomeData();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);
  @override
  Future<PopularArticlesResponse> getHomeData() async {
    return await _appServiceClient.getHomeData('0B5thyIkVSbbRJIPL9DEkOI1AIyC3wls');
  }

}
