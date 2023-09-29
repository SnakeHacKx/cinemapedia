import 'package:cinemapedia/infrastructure/models/the_moviedb/movie_details.dart';
import 'package:dio/dio.dart';

import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/the_moviedb/the_moviedb_response.dart';

class TheMovieDbDatasource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX',
      },
    ),
  );

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieDbReponse = TheMovieDbResponse.fromJson(json);

    final List<Movie> movies = movieDbReponse.results
        .where((movieDb) =>
            movieDb.posterPath !=
            'no-poster') // Si no tiene el poster, no se crea la pelicula
        .map((movieDb) => MovieMapper.movieDBToEntity(movieDb))
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    // TODO: si quiero que siempre se cargue los mismo,eliminar los query parameters
    // esto por ejemplo me serviria para los job areas en el perfil del usuario
    final resp = await dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );

    return _jsonToMovies(resp.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final resp = await dio.get(
      '/movie/popular',
      queryParameters: {'page': page},
    );

    return _jsonToMovies(resp.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final resp = await dio.get(
      '/movie/upcoming',
      queryParameters: {'page': page},
    );

    return _jsonToMovies(resp.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final resp = await dio.get(
      '/movie/top_rated',
      queryParameters: {'page': page},
    );

    return _jsonToMovies(resp.data);
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final resp = await dio.get('/movie/$id');

    if (resp.statusCode != 200) throw Exception('Movie with id $id not found');

    final movieDetails = MovieDetails.fromJson(resp.data);

    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);

    return movie;
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {

    if (query.isEmpty) return [];

    final resp = await dio.get(
      '/search/movie',
      queryParameters: {'query': query},
    );

    return _jsonToMovies(resp.data);
  }
}
