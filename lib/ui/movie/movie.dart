import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jaeger/api/models/movie_model.dart';
import 'package:jaeger/api/repository/repository.dart';
import 'package:jaeger/helper/alert.dart';
import 'package:jaeger/helper/service_locator.dart';
import 'package:jaeger/ui/description/description.dart';
import 'package:jaeger/ui/movie/bloc/movie_event.dart';
import 'package:jaeger/ui/movie/bloc/movie_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'bloc/movie_bloc.dart';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> with AutomaticKeepAliveClientMixin {

  final PurchaseRepository repository = locator<PurchaseRepository>();
  var _refreshController = RefreshController(initialRefresh: true);
  String error = 'No Movies';
  List< MovieModel> _films;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
        child: BlocProvider(
          create: (context) => FilmBloc(repository: repository),
          child: Builder(
            builder: (context) => BlocListener<FilmBloc, FilmState>(
              listener: (context, state) {
                if (state is FilmFailureState) {
                  _refreshController.refreshFailed();
                  Alert(icon: Icons.report, title: state.error, subtitle: '').show(context);
                }
              },
              child: BlocBuilder<FilmBloc, FilmState>(
                builder: (context, state) {
                  if (state is FilmSuccessState) {
                    _refreshController.refreshCompleted();
                    _films = state.film;
                  }

                  return Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF0D0838)
                      ),
                    child: SizedBox.expand(
                      child: SmartRefresher(
                        enablePullDown: true,
                        enablePullUp: false,
                        onRefresh: () async {
                          BlocProvider.of<FilmBloc>(context).add(FetchFilmEvent());
                        },
                        controller: _refreshController,
                        child: _films == null || _films.length < 1 ? Center(
                          child: Text('$error', style: TextStyle(color: Colors.white)),
                        ) : ListView.builder(
                          itemCount: _films.length,
                            itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                              height: 120,
                              child: Card(
                                color: Colors.white,
                                child: InkWell(
                                    onTap: () {
                                      final route = MaterialPageRoute(builder: (context) => Description(movie: _films[index]));
                                      Navigator.push(context, route);
                                    },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                                    ),
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            SizedBox(width: 5),
                                            Text('${_films[index].title}', style: TextStyle(fontWeight: FontWeight.w600 ,color:  Color(0xFF062D73)),),
                                            Spacer(flex: 5,),
                                            Text('${_films[index].releaseDate}', style: TextStyle(color: Color(0xFF7D7D7D)))
                                          ],
                                        ),

                                        SizedBox(
                                          height: 5,
                                        ),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            SizedBox(width: 5),
                                            Text('Director:', style: TextStyle(fontWeight: FontWeight.w600 ,color: Color(0xFF000000)),),
                                            SizedBox(width: 3),
                                            Text(_films[index].director, style: TextStyle(color:  Color(0xFF062D73)),)
                                          ],
                                        ),

                                        SizedBox(
                                          height: 5,
                                        ),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            SizedBox(width: 5),
                                            Text('Producer:', style: TextStyle(fontWeight: FontWeight.w600 ,color: Color(0xFF000000)),),
                                            SizedBox(width: 3),
                                            Text(_films[index].producer, style: TextStyle(color:  Color(0xFF062D73)),)
                                          ],
                                        ),

                                        SizedBox(
                                          height: 5,
                                        ),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            SizedBox(width: 5),
                                            Text('Rating:', style: TextStyle(fontWeight: FontWeight.w600 ,color: Color(0xFF000000)),),
                                            SizedBox(width: 3),
                                            Text(_films[index].rtScore, style: TextStyle(color:  Color(0xFF062D73)),)
                                          ],
                                        )

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                            }
                        ) ,
                      ),
                    ),
                  );

                },
              ),
            ),
          ),
        )
    );
  }

  @override
  bool get wantKeepAlive => true;
}
