import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix/common/utils.dart';
import 'package:netflix/models/movie_detailed_model.dart';
import 'package:netflix/models/movie_download_model.dart';
import 'package:netflix/models/movie_recommendation_model.dart';
import 'package:netflix/services/api_services.dart';
import 'package:netflix/services/download_services.dart';

class MovieDetailedScreen extends StatefulWidget {
  final int movieId;
  final bool isDownloaded;
  const MovieDetailedScreen({
    super.key,
    required this.movieId,
    this.isDownloaded = false,
  });

  @override
  State<MovieDetailedScreen> createState() => _MovieDetailedScreenState();
}

class _MovieDetailedScreenState extends State<MovieDetailedScreen> {
  ApiServices apiServices = ApiServices();

  late Future<MovieDetailedModel> movieDetail;
  late Future<MovieRecommendationModel> movieRecommendations;

  @override
  void initState() {
    super.initState();
    fetchInitialData();
  }

  void fetchInitialData() {
    movieDetail = apiServices.getMovieDetails(widget.movieId);
    movieRecommendations = apiServices.getMovieRecommendations(widget.movieId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isDownloaded = DownloadService.isDownloaded(widget.movieId);
    print(widget.movieId);
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: movieDetail,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final movie = snapshot.data;
              String genreText = movie!.genres
                  .map((Genre) => Genre.name)
                  .join(', ');
              return Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "${imageUrl}${movie.posterPath}",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: SafeArea(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            movie.releaseDate!.year.toString(),
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Text(
                              genreText,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: 30),

                          if (!widget.isDownloaded)
                            IconButton(
                              onPressed: isDownloaded
                                  ? null
                                  : () {
                                      DownloadService.addDownload(
                                        MovieDownloadModel(
                                          id: movie.id,
                                          title: movie.title,
                                          posterPath: movie.posterPath!,
                                          rating: movie.voteAverage,
                                        ),
                                      );
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Downloaded successfully',
                                          ),
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                    },
                              icon: Icon(Icons.download, color: Colors.white),
                            ),
                          SizedBox(width: 15),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        movie.overview,
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  FutureBuilder(
                    future: movieRecommendations,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final movie = snapshot.data;

                        return movie!.results.isEmpty
                            ? SizedBox()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('More like this'),

                                  SizedBox(height: 20),

                                  GridView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: movie.results.length,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 15,
                                          crossAxisSpacing: 5,
                                          childAspectRatio: 1.5 / 2,
                                        ),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MovieDetailedScreen(
                                                    movieId:
                                                        movie.results[index].id,
                                                  ),
                                            ),
                                          );
                                        },
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              "${imageUrl}${movie.results[index].posterPath}",
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                      }
                      return const Text('Something went wrong');
                    },
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  SizedBox(height: 50,),
                  Center(child: CircularProgressIndicator(color: Colors.blueGrey[600],)),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
