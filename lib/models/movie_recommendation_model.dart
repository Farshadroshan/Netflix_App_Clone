import 'dart:convert';

class MovieRecommendationModel {
  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  MovieRecommendationModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieRecommendationModel.fromRawJson(String str) =>
      MovieRecommendationModel.fromJson(json.decode(str));

  factory MovieRecommendationModel.fromJson(Map<String, dynamic> json) =>
      MovieRecommendationModel(
        page: json["page"] ?? 0,
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"] ?? 0,
        totalResults: json["total_results"] ?? 0,
      );
}

class Result {
  bool adult;
  String? backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String? originalTitle;
  String? overview;
  double popularity;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  bool video;
  double voteAverage;
  int voteCount;

  Result({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    this.originalTitle,
    this.overview,
    required this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Result.fromRawJson(String str) =>
      Result.fromJson(json.decode(str));

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"] ?? false,
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"] ?? 0,
        originalLanguage: json["original_language"] ?? "",
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: (json["popularity"] ?? 0).toDouble(),
        posterPath: json["poster_path"],
        releaseDate:
            json["release_date"] != null && json["release_date"] != ""
                ? DateTime.tryParse(json["release_date"])
                : null,
        title: json["title"],
        video: json["video"] ?? false,
        voteAverage: (json["vote_average"] ?? 0).toDouble(),
        voteCount: json["vote_count"] ?? 0,
      );
}
