import 'package:equatable/equatable.dart';
import 'package:jaeger/db/purchase_db.dart';

abstract class FilmEvent extends Equatable {
  const FilmEvent();

  @override
  List<Object> get props => [];
}

class FetchFilmEvent extends FilmEvent {

  FetchFilmEvent();

  @override
  List<Object> get props => [];

}