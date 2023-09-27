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
            : 'no-poster',
        releaseDate: movieDb.releaseDate,
        title: movieDb.title,
        video: movieDb.video,
        voteAverage: movieDb.voteAverage,
        voteCount: movieDb.voteCount,
      );
}
