// ignore_for_file: non_constant_identifier_names


import 'package:most_popular_articales/domain/models/most_poplar_articles_response/Result.dart';

class PopularArticlesResponse {
  dynamic copyright;
  int? num_results;
  List<Result>? results;
  dynamic status;

  PopularArticlesResponse(
      {this.copyright, this.num_results, this.results, this.status});

  factory PopularArticlesResponse.fromJson(Map<String, dynamic> json) {
    return PopularArticlesResponse(
      copyright: json['copyright'],
      num_results: json['num_results'],
      results: json['results'] != null
          ? (json['results'] as List).map((i) => Result.fromJson(i)).toList()
          : null,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['copyright'] = copyright;
    data['num_results'] = num_results;
    data['status'] = status;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
