 
import 'package:hive/hive.dart';
import '../models/movie_download_model.dart';

class DownloadService {
  static final Box<MovieDownloadModel> _box =
      Hive.box<MovieDownloadModel>('downloads');

  // add download
  static void addDownload(MovieDownloadModel movie) {
    _box.put(movie.id, movie);
  }

  // get all downloads
  static List<MovieDownloadModel> getDownloads() {
    return _box.values.toList();
  }

  // check already downloaded
  static bool isDownloaded(int movieId) {
    return _box.containsKey(movieId);
  }

  // delete download (optional)
  static void removeDownload(int movieId) {
    _box.delete(movieId);
  }
}
