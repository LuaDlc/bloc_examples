import 'package:bloc_multiple_states/screens/counter_screen.dart';
import 'package:bloc_multiple_states/screens/favourite_app_screen.dart';
import 'package:bloc_multiple_states/screens/image_picker_screen.dart';
import 'package:bloc_multiple_states/screens/posts_screen.dart';
import 'package:bloc_multiple_states/screens/switch_example.dart';
import 'package:bloc_multiple_states/screens/to_do_screen.dart';
import 'package:flutter/material.dart';

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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CounterScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite_border_outlined),
              title: const Text('Meus favoritos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavouriteAppScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_album_rounded),
              title: const Text('Álbum'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ImagePickerScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.email_sharp),
              title: const Text('Emails'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PostsScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.today_outlined),
              title: const Text('ToDO'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ToDoScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notificacoes'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SwitchExample(),
                  ),
                );
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
