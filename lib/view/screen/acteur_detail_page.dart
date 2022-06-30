import 'package:film2/data/acteurs_data.dart';
import 'package:flutter/material.dart';

class ActeurDetailPage extends StatelessWidget {
  const ActeurDetailPage({Key? key}) : super(key: key);

  static const routeName="/acteur-detail";

  Future<Object> getActeur(int id) async {
    var acteur = await ActeursData().getActeur(id);
    return acteur;
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, int>;
    final acteurId = routeArgs['id'];
    final acteur = getActeur(acteurId as int);
    print(acteur);
    return Scaffold(
      appBar: AppBar(
        title:  const Text('TMDB application'),
      ),
      body:Center(
        child: Text("hello"),
      ),
    );
  }
}
