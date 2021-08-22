class Movie {
  String? slideImage;
  String? title;
  String? subtitle;
  bool? isHD = false;
  double? percent;
  String? url;
  String? id;
  Duration? continueDuration;
  String? author;

  Movie(
      {this.id,
      this.slideImage,
      this.title,
      this.isHD,
      this.percent,
      this.url,
      this.subtitle,
      this.continueDuration,
      this.author});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      slideImage: json['slide_image'] as String?,
      title: json['title'] as String?,
      subtitle: json['sub_title'] as String?,
      isHD: json['is_hd'] as bool?,
      percent: json['percent'] as double?,
      url: json['url'] as String?,
      id: json['id'] as String?,
      continueDuration: json['continue_duration'] as Duration?,
      author: json['author'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slide_image'] = slideImage;
    data['title'] = title;
    data['sub_title'] = subtitle;
    data['is_hd'] = isHD;
    data['percent'] = percent;
    data['url'] = url;
    data['id'] = id;
    data['continue_duration'] = continueDuration;
    data['author'] = author;
    return data;
  }
}

class PlaylistMovie {
  String title;
  String subtitle;
  String slideImage;
  String id;
  String? author;

  List<Movie>? listMovies;
  bool? isHD = false;
  PlaylistMovie({
    required this.title,
    required this.subtitle,
    required this.slideImage,
    required this.id,
    this.listMovies,
    this.isHD,
    this.author,
  });
}
