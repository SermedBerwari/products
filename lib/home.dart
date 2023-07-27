import 'package:flutter/material.dart';
import 'package:my_first_app/main.dart';
import 'package:my_first_app/pages/favorite.dart';
import 'package:my_first_app/pages/products.dart';
import 'package:my_first_app/splash.dart';
import 'package:my_first_app/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pages = [const Products(), const Favorite()];
  late int pageIndex;

  @override
  void initState() {
    pageIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      endDrawer: MyDrawer(),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              prefs!.setBool("isLogined", false);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const SplashScreen()));
            },
            icon: const Icon(Icons.logout)),
        title: const Text('Home Screen'),
      ),
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: chagePageIndex,
          backgroundColor: Colors.indigo,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                label: "Home",
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.amber,
                  size: 35,
                )),
            BottomNavigationBarItem(
                label: "Favortie",
                icon: Icon(
                  Icons.favorite_outline,
                  color: Colors.amber,
                  size: 35,
                ))
          ]),
    );
  }

  chagePageIndex(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
