import 'package:film2/data/acteurs_data.dart';
import 'package:film2/view/widget/acteur_item.dart';
import 'package:flutter/material.dart';

class ActeursPage extends StatelessWidget {
  const ActeursPage({Key? key}) : super(key: key);

  Future<List> getActeurs() async {
    var plainJson = await ActeursData().getPopularActeurs();
    var acteurs = plainJson['results'] as List;
    return acteurs;
  }

  @override
  Widget build(BuildContext context) {
    var acteursData = getActeurs();
    return FutureBuilder(
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
          final data = snapshot.data as List;
          return GridView.builder(
              itemBuilder: (context,index) {
                return ActeurItem(data[index]['name'], data[index]['id'], data[index]['profile_path']);
              },
            itemCount: data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 250,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              );
          // return ListView.builder(
          //     itemBuilder: (context,index) {
          //       return ActeurItem(data[index]['name'], data[index]['profile_path']);
          //     },
          //     itemCount: data.length
          // );
        }else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      future: getActeurs(),
    );
  }
}
