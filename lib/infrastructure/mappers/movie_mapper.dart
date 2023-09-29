import 'package:cinemapedia/infrastructure/models/the_moviedb/movie_details.dart';

import '../../domain/entities/movie.dart';
import '../models/the_moviedb/movie_the_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieFromTheMovieDB movieDb) => Movie(
        adult: movieDb.adult,
        backdropPath: movieDb.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/w500${movieDb.backdropPath}'
            : 'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png',
        genreIds: movieDb.genreIds.map((e) => e.toString()).toList(),
        id: movieDb.id,
        originalLanguage: movieDb.originalLanguage,
        originalTitle: movieDb.originalTitle,
        overview: movieDb.overview,
        popularity: movieDb.popularity,
        posterPath: movieDb.posterPath != ''
            ? 'https://image.tmdb.org/t/p/w500${movieDb.posterPath}'
            : 'https://static.wikia.nocookie.net/ideas/images/6/66/FoxAndroidTM2%27s_No_Poster.jpg/revision/latest?cb=20230213155127',
            // TODO: en vez de hacerlo asi en FAP, quisiera poner que la propiedad de la entidad pueda ser null
        releaseDate: movieDb.releaseDate != null ? movieDb.releaseDate! : DateTime.now(),
        title: movieDb.title,
        video: movieDb.video,
        voteAverage: movieDb.voteAverage,
        voteCount: movieDb.voteCount,
      );

  static Movie movieDetailsToEntity(MovieDetails movieDb) => Movie(
        adult: movieDb.adult,
        backdropPath: movieDb.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/w500${movieDb.backdropPath}'
            : 'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png',
        genreIds: movieDb.genres.map((e) => e.name).toList(),
        id: movieDb.id,
        originalLanguage: movieDb.originalLanguage,
        originalTitle: movieDb.originalTitle,
        overview: movieDb.overview,
        popularity: movieDb.popularity,
        posterPath: movieDb.posterPath != ''
            ? 'https://image.tmdb.org/t/p/w500${movieDb.posterPath}'
            : 'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png',
        releaseDate: movieDb.releaseDate,
        title: movieDb.title,
        video: movieDb.video,
        voteAverage: movieDb.voteAverage,
        voteCount: movieDb.voteCount,
      );
}
