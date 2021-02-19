import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jaeger/ui/home/home.dart';

import 'helper/service_locator.dart';
import 'main_bloc_observer.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  Bloc.observer = MainBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jaeger',
      theme: ThemeData(
        fontFamily: "ProximaNova",
        appBarTheme: AppBarTheme(
            color: Color(0xFF100D3B)
        ),
        // primarySwatch: Colors.blue,
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF25E0D3)),
              foregroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFFFFF)),
              side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Color(0xFF25E0D3)))
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF100D3B)),
              foregroundColor: MaterialStateProperty.all<Color>(Color(0xFF25E0D3)),
              side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Color(0xFF100D3B)))
          ),
        ),
        textTheme: TextTheme(
            bodyText2: TextStyle(
                fontFamily: "ProximaNova",
                fontSize: 12.0,
                color: Color(0xFF100D3B)
            ),
            bodyText1: TextStyle(
                fontFamily: "ProximaNova",
                fontSize: 12.0,
                color: Color(0xFF100D3B)
            )
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

