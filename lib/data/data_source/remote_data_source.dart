import 'package:dio/dio.dart';
import 'package:most_popular_articales/app/constants.dart';
import 'package:most_popular_articales/data/network/dio_helper.dart';

abstract class RemoteDataSource {
  Future<Response> getHomeData();
}

class RemoteDataSourceImpl implements RemoteDataSource {

  @override
  Future<Response> getHomeData() async {
    return await DioHelper.getData(
        url: Constants.SECTION_PATH,
        query: {
          'api-key':'0B5thyIkVSbbRJIPL9DEkOI1AIyC3wls'
        }
    );
  }

}
