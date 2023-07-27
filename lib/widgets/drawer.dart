import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.amber,
      child: Column(children: [
        DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blue),
            child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: const Image(
                  image: NetworkImage(
                      'https://amatime.com.br/cdn/shop/files/AMA_LOGO_410x.png?v=1651500197'),
                ))),
        const ListTile(
          title: Text('Profile Screen'),
        ),
        const ListTile(
          title: Text('Settings'),
        ),
        const ListTile(
          title: Text('Logout'),
        )
      ]),
    );
  }
}
