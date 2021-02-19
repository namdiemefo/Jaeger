import 'package:dio/dio.dart';
import 'package:jaeger/api/models/movie_model.dart';
import 'package:retrofit/retrofit.dart';

part 'client.g.dart';

@RestApi(baseUrl: "https://ghibliapi.herokuapp.com")
abstract class Client {
  factory Client(Dio dio, {String baseUrl}) = _Client;

  @GET('/films')
  Future<List<MovieModel>> getFilm();

}