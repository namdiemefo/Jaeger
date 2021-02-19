import 'package:equatable/equatable.dart';
import 'package:jaeger/api/models/movie_model.dart';

abstract class FilmState extends Equatable {
  const FilmState();

  @override
  List<Object> get props => [];

}

class FilmInitialState extends FilmState {
  FilmInitialState();

  @override
  List<Object> get props => [];
}

class FilmSuccessState extends FilmState {
  final List<MovieModel> film;

  FilmSuccessState(this.film);

  @override
  List<Object> get props => [film];
}

class FilmFailureState extends FilmState {
  final String error;

  FilmFailureState(this.error);

  @override
  List<Object> get props => [error];
}