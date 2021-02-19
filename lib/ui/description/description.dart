import 'package:flutter/material.dart';
import 'package:jaeger/api/models/movie_model.dart';


class Description extends StatelessWidget {

  final MovieModel movie;

  Description({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      backgroundColor: Color(0xFF0D0838),
      body: Container(
          height: 300,
          padding: EdgeInsets.fromLTRB(15.0, 20.0, 0.0, 0.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //border: Border.all(),
            color: Colors.grey.shade400,
          ),
        child: Text(movie.description, style: TextStyle(fontSize: 12, fontFamily: "ProximaNova", color: Colors.black87)),
      ),
    );
  }
}
