import 'package:flutter/material.dart';
import 'package:my_first_app/main.dart';
import 'package:my_first_app/product_list.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  late List<String> favorite;

  @override
  void initState() {
    favorite = prefs!.getStringList('favorite') ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(favorite);
    return ListView.builder(
        itemCount: favorite.length,
        itemBuilder: (context, index) {
          Map itemData = getFavoriteItemData(favorite[index]);
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue,
            ),
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(3.0),
            child: ListTile(
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image(image: NetworkImage(itemData['image']))),
              title: Text(
                itemData['name'],
                style: const TextStyle(color: Colors.white, fontSize: 22),
              ),
              subtitle: Text(itemData['price'],
                  style: const TextStyle(color: Colors.white, fontSize: 16)),
              trailing: IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {},
              ),
            ),
          );
        });
  }

  Map getFavoriteItemData(name) {
    List foods = Foods().getFoodList();
    late Map favoriteMap;
    foods.map((category) {
      category['items'].map((item) {
        if (item['name'] == name) {
          favoriteMap = item;
        }
      }).toList();
    }).toList();
    return favoriteMap;
  }
}
