import 'package:dio/dio.dart';
import 'package:nepflix/core/infrastructure/dio_extensions.dart';
import 'package:nepflix/core/infrastructure/rest_api_exception.dart';
import 'package:nepflix/movies/infrastructure/movies_result_dto.dart';

class MovieRemoteService {
  final Dio dio;

  MovieRemoteService(this.dio);

  Future<MoviesResultDTO> getPopularMovies() async {
    try {
      final response = await dio.get(
        "https://api.themoviedb.org/3/movie/popular",
        queryParameters: {
          "api_key": "4130fb2a642d3801adc666aa95e857d5",
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
