import 'package:dio/dio.dart';
import 'package:nepflix/core/infrastructure/dio_client.dart';
import 'package:nepflix/core/infrastructure/dio_extensions.dart';
import 'package:nepflix/core/infrastructure/rest_api_exception.dart';
import 'package:nepflix/movies/infrastructure/movies_result_dto.dart';

class MovieRemoteService {
  final DioClient _dioClient;

  MovieRemoteService(this._dioClient);

  Future<MoviesResultDTO> getPopularMovies({int page = 1}) async {
    try {
      final response = await _dioClient.dio.get(
        "https://api.themoviedb.org/3/movie/popular",
        queryParameters: {"page": page},
      );
      return MoviesResultDTO.fromJson(response.data);
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        throw RestApiException(message: "No Internet Connection");
      } else {
        throw RestApiException(message: e.message ?? "");
      }
    }
  }

  Future<MoviesResultDTO> getNowPlayingMovies() async {
    try {
      final response = await _dioClient.dio
          .get("https://api.themoviedb.org/3/movie/top_rated");
      return MoviesResultDTO.fromJson(response.data);
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        throw RestApiException(message: "No Internet Connection");
      } else {
        throw RestApiException(message: e.message ?? "");
      }
    }
  }

  Future<MoviesResultDTO> getMoviesByGenre(int genreID) async {
    try {
      final response = await _dioClient.dio.get(
        "https://api.themoviedb.org/3/discover/movie",
        queryParameters: {
          "with_genres": genreID,
        },
      );
      return MoviesResultDTO.fromJson(response.data);
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        throw RestApiException(message: "No Internet Connection");
      } else {
        throw RestApiException(message: e.message ?? "");
      }
    }
  }
}
