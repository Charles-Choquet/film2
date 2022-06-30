import 'package:film2/view/screen/acteur_detail_page.dart';
import 'package:flutter/material.dart';

class ActeurItem extends StatelessWidget {

  final String name;
  final int id;
  final String profilePath;

  const ActeurItem(this.name,this.id, this.profilePath);


  void selectedActeur(BuildContext context) {
    Navigator.of(context)
        .pushNamed(ActeurDetailPage.routeName, arguments: {
      'id': id
    });

  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedActeur(context),
      child: Card(
        child: SizedBox(
          width: 150,
          height: 250,
          child: Column(
            children: [
              Image(image: NetworkImage("https://image.tmdb.org/t/p/w500" + profilePath),
                  fit: BoxFit.cover),
              Text(name)
            ],
          ),
        ),
      ),
    );
  }
}