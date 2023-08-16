import 'package:dio/dio.dart';
import 'package:most_popular_articales/domain/models/most_poplar_articles_response/PopularArticlesResponse.dart';
import 'package:retrofit/http.dart';

import '../../app/constants.dart';

part 'app_api.g.dart';
//https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=0B5thyIkVSbbRJIPL9DEkOI1AIyC3wls

@RestApi(baseUrl: Constants.BASE_URL)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET(Constants.SECTION_PATH)
  Future<PopularArticlesResponse> getHomeData(
    @Query("api-key") String apiKey,);
}
