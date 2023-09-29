// Este repositorio es inmutable. Es solo lectura
import 'package:cinemapedia/infrastructure/datasources/actor_themoviedb_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/repositories/actor_repository_impl.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorTheMovieDBDatasource());
});
