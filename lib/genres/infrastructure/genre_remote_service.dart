import 'package:dio/dio.dart';
import 'package:nepflix/core/infrastructure/dio_client.dart';
import 'package:nepflix/core/infrastructure/dio_extensions.dart';
import 'package:nepflix/core/infrastructure/rest_api_exception.dart';
import 'package:nepflix/genres/domain/genre.dart';
import 'package:nepflix/genres/infrastructure/genre_dto.dart';

class GenreRemoteService {
  final DioClient _dioClient;

  GenreRemoteService(this._dioClient);

  Future<List<GenreDTO>> getGenres() async {
    try {
      final response = await _dioClient.dio
          .get("https://api.themoviedb.org/3/genre/movie/list");
      if (response.statusCode == 200) {
        return List<GenreDTO>.from(
            (response.data["genres"] as List).map((e) => GenreDTO.fromJson(e)));
      }
      throw Exception("Failed to fetch genre list");
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        throw RestApiException(message: "No Internet Connection");
      } else {
        throw RestApiException(message: e.message ?? "");
      }
    }
  }
}
