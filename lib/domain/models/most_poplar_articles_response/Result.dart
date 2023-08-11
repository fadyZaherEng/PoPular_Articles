
import 'package:most_popular_articales/domain/models/most_poplar_articles_response/Media.dart';

class Result {
  dynamic abstracts;
  dynamic adx_keywords;
  dynamic asset_id;
  dynamic byline;
  List<String>? des_facet;
  dynamic eta_id;
  dynamic id;
  List<Media>? media;
  dynamic nytdsection;
  List<String>? org_facet;
  List<String>? per_facet;
  dynamic published_date;
  dynamic section;
  dynamic source;
  dynamic subsection;
  dynamic title;
  dynamic type;
  dynamic updated;
  dynamic uri;
  dynamic url;

  Result(
      {this.abstracts,
      this.adx_keywords,
      this.asset_id,
      this.byline,
      this.des_facet,
      this.eta_id,
      this.id,
      this.media,
      this.nytdsection,
      this.org_facet,
      this.per_facet,
      this.published_date,
      this.section,
      this.source,
      this.subsection,
      this.title,
      this.type,
      this.updated,
      this.uri,
      this.url});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      abstracts: json['abstract'],
      adx_keywords: json['adx_keywords'],
      asset_id: json['asset_id'],
      byline: json['byline'],
      des_facet: json['des_facet'] != null
          ? new List<String>.from(json['des_facet'])
          : null,
      eta_id: json['eta_id'],

      id: json['id'],
      media: json['media'] != null
          ? (json['media'] as List).map((i) => Media.fromJson(i)).toList()
          : null,
      nytdsection: json['nytdsection'],
      org_facet: json['org_facet'] != null
          ? new List<String>.from(json['org_facet'])
          : null,
      per_facet: json['per_facet'] != null
          ? new List<String>.from(json['per_facet'])
          : null,
      published_date: json['published_date'],
      section: json['section'],
      source: json['source'],
      subsection: json['subsection'],
      title: json['title'],
      type: json['type'],
      updated: json['updated'],
      uri: json['uri'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['abstract'] = abstracts;
    data['adx_keywords'] = adx_keywords;
    data['asset_id'] = asset_id;
    data['byline'] = byline;
    data['eta_id'] = eta_id;
    data['id'] = id;
    data['nytdsection'] = nytdsection;
    data['published_date'] = published_date;
    data['section'] = section;
    data['source'] = source;
    data['subsection'] = subsection;
    data['title'] = title;
    data['type'] = type;
    data['updated'] = updated;
    data['uri'] = uri;
    data['url'] = url;

    if (des_facet != null) {
      data['des_facet'] = des_facet;
    }

    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
    }
    if (org_facet != null) {
      data['org_facet'] = org_facet;
    }
    if (per_facet != null) {
      data['per_facet'] = per_facet;
    }
    return data;
  }
}
