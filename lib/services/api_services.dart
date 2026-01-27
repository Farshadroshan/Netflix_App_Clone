import 'dart:convert';
import 'dart:developer';

import 'package:netflix/common/utils.dart';
// import 'package:netflix/models/Upcoming_model.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/models/movie_detailed_model.dart';
import 'package:netflix/models/movie_recommendation_model.dart';
import 'package:netflix/models/search_model.dart';
import 'package:netflix/models/tv_series_model.dart';
import 'package:netflix/models/upcoming_model.dart';


// var key = "?api_key = $apiKey";
late String endPoint;

class ApiServices {
  final _baseUrl = "https://api.themoviedb.org/3/";
  Future<UpcomingMovieModel> getUpcomingMovies()async{
    endPoint = "movie/upcoming";
    final url = "$_baseUrl$endPoint";

    final response = await http.get(Uri.parse(url),headers: {"Authorization": "Bearer $apiKey"});

    if(response.statusCode == 200){
      // log("success response: ${response.body}");
      log('Success');

      return UpcomingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Faild to load upcoming movies");
  }

  Future<UpcomingMovieModel> getNowPlayingMovies()async{
    endPoint = "movie/now_playing";
    final url = "$_baseUrl$endPoint";

    final response = await http.get(Uri.parse(url),headers: {"Authorization": "Bearer $apiKey"});

    if(response.statusCode == 200){
      // log("Success response: ${response.body}");
      log('Succes');

      return UpcomingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Faild to load now playing movies");
  }


  Future<TvSeriesModel> getTopRatedSeries()async{
    endPoint = "tv/top_rated";
    final url = "$_baseUrl$endPoint";

    final response = await http.get(Uri.parse(url),headers: {"Authorization": "Bearer $apiKey"});

    if(response.statusCode == 200){
      log("Success");

      return TvSeriesModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Faild to load top rated tvseries");
  }

  Future<SearchModel> getSearchedMovie(String searchText)async{
    endPoint = "search/movie?query=$searchText";
    final url = "$_baseUrl$endPoint";
    print("search url is $url");
    final response = await http.get(Uri.parse(url),headers: {"Authorization": "Bearer $apiKey"});

    if(response.statusCode == 200){
      log("Success");

      return SearchModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Faild to load searched movie");
  }

  Future<MovieRecommendationModel> getPopularMovies()async{
    endPoint = "movie/popular";
    final url = "$_baseUrl$endPoint";

    final response = await http.get(Uri.parse(url),headers: {"Authorization": "Bearer $apiKey"});

    if(response.statusCode == 200){
      log("Success");

      return MovieRecommendationModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Faild to load popular movies");
  }

  Future<MovieDetailedModel> getMovieDetails(int movieId)async{
    endPoint = "movie/$movieId";
    final url = "$_baseUrl$endPoint";
    print("movie details url is $url");

    final response = await http.get(Uri.parse(url),headers: {"Authorization": "Bearer $apiKey"});

    if(response.statusCode == 200){
      log("Success");

      return MovieDetailedModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Faild to load movie details");
  }


  Future<MovieRecommendationModel> getMovieRecommendations(int movieId)async{
    endPoint = "movie/$movieId/recommendations";
    final url = "$_baseUrl$endPoint";
    print("recommendations url is $url");

    final response = await http.get(Uri.parse(url),headers: {"Authorization": "Bearer $apiKey"});

    if(response.statusCode == 200){
      log("Success");

      return MovieRecommendationModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Faild to load more like this");
  }

  
  // //code test 
  // Future<List<String>> fetchCountries()async{
  //   final url = 'https://restcountries.com/v3.1/all?fields=name';

  //   final response = await http.get(Uri.parse(url));

  //   if(response.statusCode == 200){
  //     List data = jsonDecode(response.body);

  //     List<String> countries = [];

  //     for(var item in data){
  //       countries.add(item['name']['common']);
  //     }

  //     return countries;
  //   }else{
  //     throw Exception('Failed to load countries');
  //   }
  // }
}