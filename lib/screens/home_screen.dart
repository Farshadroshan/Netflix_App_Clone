import 'package:flutter/material.dart';
import 'package:netflix/models/tv_series_model.dart';
import 'package:netflix/models/upcoming_model.dart';
import 'package:netflix/screens/search_screen.dart';
// import 'package:netflix/models/Upcoming_model.dart';
import 'package:netflix/services/api_services.dart';
import 'package:netflix/widget/custom_carousel.dart';
import 'package:netflix/widget/movie_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<UpcomingMovieModel> upcomingFuture;
  late Future<UpcomingMovieModel> nowPlayingFuture;
  late Future<TvSeriesModel> topRatedSeries;
  


  ApiServices apiServies = ApiServices();
  @override
  void initState() {
    super.initState();
    upcomingFuture = apiServies.getUpcomingMovies();
    nowPlayingFuture = apiServies.getNowPlayingMovies();
    topRatedSeries = apiServies.getTopRatedSeries();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset('assets/logo.png', height: 50, width: 120),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                );
              },
              child: Icon(Icons.search, size: 30, color: Colors.white),
            ),
          ),

          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(color: Colors.blue, height: 27, width: 27),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: topRatedSeries,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CustomCarouselSlider(data: snapshot.data!);
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            SizedBox(
              height: 220,
              child: MovieCardWidget(
                future: nowPlayingFuture,
                headLineText: 'Now Playing',
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 220,
              child: MovieCardWidget(
                future: upcomingFuture,
                headLineText: 'Upcoming Movies',
              ),
            ),
            
            
          ],
        ),
      ),
    );
  }
}
