
import 'package:most_popular_articales/domain/models/most_poplar_articles_response/MediaMetadata.dart';

class Media {
  dynamic approvedForSyndication;
  dynamic caption;
  dynamic copyright;
  List<MediaMetadata>? mediaMetadataRes;
  dynamic subtype;
  dynamic type;

  Media(
      {this.approvedForSyndication,
      this.caption,
      this.copyright,
      this.mediaMetadataRes,
      this.subtype,
      this.type});

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      approvedForSyndication: json['approved_for_syndication'],
      caption: json['caption'],
      copyright: json['copyright'],
      mediaMetadataRes: json['media-metadata'] != null
          ? (json['media-metadata'] as List)
              .map((i) => MediaMetadata.fromJson(i))
              .toList()
          : null,
      subtype: json['subtype'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['approved_for_syndication'] = approvedForSyndication;
    data['caption'] = caption;
    data['copyright'] = copyright;
    data['subtype'] = subtype;
    data['type'] = type;
    if (mediaMetadataRes != null) {
      data['media-metadata'] =
          mediaMetadataRes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
