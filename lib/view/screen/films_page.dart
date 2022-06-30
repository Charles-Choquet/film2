import 'package:film2/data/films_data.dart';
import 'package:film2/view/widget/film_item.dart';
import 'package:flutter/material.dart';

class FilmsPage extends StatelessWidget {
  const FilmsPage({Key? key}) : super(key: key);

  Future<List> getFilms() async {
   var plainJson = await FilmsData().getPopularFilms();
   var films = plainJson['results'] as List;
   return films;
  }

  @override
  Widget build(BuildContext context) {
    var filmsData = getFilms();
    return FutureBuilder(
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
            final data = snapshot.data as List;
            return ListView.builder(
                itemBuilder: (context,index) {
                  return FilmItem(data[index]['title'], data[index]['poster_path']);
                },
                itemCount: data.length
            );
          }else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      future: getFilms(),
    );
  }
}