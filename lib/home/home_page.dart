import 'package:flutter/material.dart';

import '../config/routes_name.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page Bloc'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text('Menu lateral'),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () {
                Navigator.pushNamed(context, RoutesName.counterScreen);
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite_border_outlined),
              title: const Text('Meus favoritos'),
              onTap: () {
                Navigator.pushNamed(context, RoutesName.favouriteScreen);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_album_rounded),
              title: const Text('Álbum'),
              onTap: () {
                Navigator.pushNamed(context, RoutesName.imagePickerScreen);
              },
            ),
            ListTile(
              leading: const Icon(Icons.email_sharp),
              title: const Text('Emails'),
              onTap: () {
                Navigator.pushNamed(context, RoutesName.postsScreen);
              },
            ),
            ListTile(
              leading: const Icon(Icons.today_outlined),
              title: const Text('ToDO'),
              onTap: () {
                Navigator.pushNamed(context, RoutesName.toDoScreen);
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notificacoes'),
              onTap: () {
                Navigator.pushNamed(context, RoutesName.switchScreen);
              },
            ),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login'),
              onTap: () {
                Navigator.pushNamed(context, RoutesName.loginScreen);
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Lets go'),
      ),
    );
  }
}
