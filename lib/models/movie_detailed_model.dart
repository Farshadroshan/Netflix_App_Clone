 import 'dart:convert';

class MovieDetailedModel {
  bool adult;
  String? backdropPath;
  BelongsToCollection? belongsToCollection;
  int budget;
  List<Genre> genres;
  String? homepage;
  int id;
  String? imdbId;
  List<String> originCountry;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String? posterPath;
  DateTime? releaseDate;
  int revenue;
  int? runtime;
  String? tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  MovieDetailedModel({
    required this.adult,
    this.backdropPath,
    this.belongsToCollection,
    required this.budget,
    required this.genres,
    this.homepage,
    required this.id,
    this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    this.releaseDate,
    required this.revenue,
    this.runtime,
    this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieDetailedModel.fromRawJson(String str) =>
      MovieDetailedModel.fromJson(json.decode(str));

  factory MovieDetailedModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailedModel(
      adult: json["adult"] ?? false,
      backdropPath: json["backdrop_path"],
      belongsToCollection: json["belongs_to_collection"] != null
          ? BelongsToCollection.fromJson(json["belongs_to_collection"])
          : null,
      budget: json["budget"] ?? 0,
      genres: json["genres"] != null
          ? List<Genre>.from(
              json["genres"].map((x) => Genre.fromJson(x)))
          : [],
      homepage: json["homepage"],
      id: json["id"],
      imdbId: json["imdb_id"],
      originCountry: json["origin_country"] != null
          ? List<String>.from(json["origin_country"])
          : [],
      originalLanguage: json["original_language"] ?? "",
      originalTitle: json["original_title"] ?? "",
      overview: json["overview"] ?? "",
      popularity: (json["popularity"] ?? 0).toDouble(),
      posterPath: json["poster_path"],
      releaseDate:
          json["release_date"] != null && json["release_date"].toString().isNotEmpty
              ? DateTime.tryParse(json["release_date"])
              : null,
      revenue: json["revenue"] ?? 0,
      runtime: json["runtime"],
      tagline: json["tagline"],
      title: json["title"] ?? "",
      video: json["video"] ?? false,
      voteAverage: (json["vote_average"] ?? 0).toDouble(),
      voteCount: json["vote_count"] ?? 0,
    );
  }
}

/* ===================== SUB MODELS ===================== */

class BelongsToCollection {
  int id;
  String name;
  String? posterPath;
  String? backdropPath;

  BelongsToCollection({
    required this.id,
    required this.name,
    this.posterPath,
    this.backdropPath,
  });

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) {
    return BelongsToCollection(
      id: json["id"],
      name: json["name"] ?? "",
      posterPath: json["poster_path"],
      backdropPath: json["backdrop_path"],
    );
  }
}

class Genre {
  int id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json["id"],
      name: json["name"] ?? "",
    );
  }
}
