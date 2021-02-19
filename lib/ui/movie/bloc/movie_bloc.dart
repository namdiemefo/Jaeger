import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jaeger/api/models/movie_model.dart';
import 'package:jaeger/api/repository/repository.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class FilmBloc extends Bloc<FilmEvent, FilmState> {
  final PurchaseRepository repository;
  // final PurchaseRepository repository = locator<PurchaseRepository>();
  FilmBloc({FilmState initialState, this.repository}) : assert(repository != null), super(initialState);

  @override
  Stream<FilmState> mapEventToState(FilmEvent event) async* {
    if (event is FetchFilmEvent) {
      yield* _fetchFilm();
    }
  }

  Stream<FilmState> _fetchFilm() async* {
      var film = await repository.getFilms();
      if (film is List<MovieModel>) {
        yield FilmSuccessState(film);
      } else {
        yield FilmFailureState(film);
      }
  }

}