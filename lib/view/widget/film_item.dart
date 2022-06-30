import 'package:flutter/material.dart';

class FilmItem extends StatelessWidget {

  final String name;
  final String posterPath;

  const FilmItem(this.name, this.posterPath);


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: SizedBox(
          width: 150,
          child: Column(
            children: [
              Image(image: NetworkImage("https://image.tmdb.org/t/p/w500" + posterPath),
                  fit: BoxFit.cover),
              Text(name)
            ],
          ),
        ),
      ),
    );
  }
}
