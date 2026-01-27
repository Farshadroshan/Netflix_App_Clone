import 'package:hive/hive.dart';

part 'movie_download_model.g.dart';

@HiveType(typeId: 0)
class MovieDownloadModel extends HiveObject {

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String posterPath;

  @HiveField(3)
  final double rating;

  MovieDownloadModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.rating,
  });
}
