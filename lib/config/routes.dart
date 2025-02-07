import 'package:bloc_multiple_states/config/routes_name.dart';
import 'package:bloc_multiple_states/home/home_page.dart';
import 'package:bloc_multiple_states/screens/counter_screen.dart';
import 'package:bloc_multiple_states/screens/favourite_app_screen.dart';
import 'package:bloc_multiple_states/screens/image_picker_screen.dart';
import 'package:bloc_multiple_states/screens/login_screen.dart';
import 'package:bloc_multiple_states/screens/posts_screen.dart';
import 'package:bloc_multiple_states/screens/switch_example.dart';
import 'package:bloc_multiple_states/screens/to_do_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.counterScreen:
        return MaterialPageRoute(builder: (context) => const CounterScreen());
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RoutesName.favouriteScreen:
        return MaterialPageRoute(
            builder: (context) => const FavouriteAppScreen());
      case RoutesName.imagePickerScreen:
        return MaterialPageRoute(
            builder: (context) => const ImagePickerScreen());
      case RoutesName.postsScreen:
        return MaterialPageRoute(builder: (context) => const PostsScreen());
      case RoutesName.switchScreen:
        return MaterialPageRoute(builder: (context) => const SwitchExample());
      case RoutesName.toDoScreen:
        return MaterialPageRoute(builder: (context) => const ToDoScreen());
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text('No route generated'),
            ),
          );
        });
    }
  }
}
