class MediaMetadata {
    dynamic format;
    int? height;
    dynamic url;
    int? width;

    MediaMetadata({this.format, this.height, this.url, this.width});

    factory MediaMetadata.fromJson(Map<String, dynamic> json) {
        return MediaMetadata(
            format: json['format'], 
            height: json['height'], 
            url: json['url'], 
            width: json['width'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data =  Map<String, dynamic>();
        data['format'] = format;
        data['height'] = height;
        data['url'] = url;
        data['width'] = width;
        return data;
    }
}