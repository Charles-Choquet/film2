import 'package:film2/view/screen/acteur_detail_page.dart';
import 'package:film2/view/screen/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
        routes: {
          ActeurDetailPage.routeName: (c) => ActeurDetailPage()
        }
    );
  }
}
