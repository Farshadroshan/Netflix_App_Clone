import 'package:flutter/material.dart';
import 'package:netflix/common/utils.dart';
import 'package:netflix/screens/movie_detailed_screen.dart';
import 'package:netflix/services/download_services.dart';

class DownloadsScreen extends StatefulWidget {
  const DownloadsScreen({super.key});

  @override
  State<DownloadsScreen> createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> {
  @override
  Widget build(BuildContext context) {
    final downloads = DownloadService.getDownloads();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Downloads",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: downloads.isEmpty
          ? const Center(
              child: Text(
                "No Downloads",
                style: TextStyle(color: Colors.white),
              ),
            )
          : ListView.builder(
              itemCount: downloads.length,
              itemBuilder: (context, index) {
                final movie = downloads[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailedScreen(
                          movieId: movie.id,
                          isDownloaded: true,
                        ),
                      ),
                    );
                  },
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          'Delete Download',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        content: const Text(
                          'Do you want to remove this movie form downloads?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 80, 80, 80),
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              DownloadService.removeDownload(movie.id);
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: Text(
                              'Delete',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: ListTile(
                    leading: Image.network("$imageUrl${movie.posterPath}"),
                    title: Text(
                      movie.title,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    subtitle: Text(
                      "⭐ ${movie.rating}",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
