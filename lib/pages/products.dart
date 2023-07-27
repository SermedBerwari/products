import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_first_app/main.dart';
import 'package:my_first_app/product_list.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  late int categoryIndex;
  @override
  void initState() {
    categoryIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> foods = Foods().getFoodList();

    return Column(
      children: [
        SizedBox(
          height: 50,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: foods.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      setState(() {
                        categoryIndex = index;
                      });
                    },
                    child: Image(image: NetworkImage(foods[index]['icon'])));
              }),
        ),
        GridView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.69, crossAxisCount: 2),
            itemCount: foods[categoryIndex]['items'].length,
            itemBuilder: (context, index) {
              var list = prefs!.getStringList("favorite");
              bool isFavorite =
                  list!.contains(foods[categoryIndex]['items'][index]['name'])
                      ? true
                      : false;

              return Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.65),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image(
                            image: NetworkImage(
                                foods[categoryIndex]['items'][index]['image'])),
                      ),
                      Text(
                        foods[categoryIndex]['items'][index]['name'],
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        foods[categoryIndex]['items'][index]['price'],
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            saveTofavoriteList(
                                foods[categoryIndex]['items'][index]['name']);
                          },
                          icon: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_outline,
                          ))
                    ],
                  ),
                ),
              );
            })
      ],
    );
  }

  saveTofavoriteList(name) {
    List<String>? favoriteList = [];
    if (prefs!.containsKey('favorite')) {
      favoriteList = prefs!.getStringList('favorite');
    }
    if (!favoriteList!.contains(name)) {
      favoriteList.add(name);
      prefs!.setStringList("favorite", favoriteList);
    } else {
      favoriteList.remove(name);
      prefs!.setStringList("favorite", favoriteList);
    }
    setState(() {});
  }
}
