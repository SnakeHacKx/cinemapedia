import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 1,
      items: const [
        BottomNavigationBarItem(
          label: 'Inicio',
          icon: Icon(Icons.home_max_outlined),
        ),
        BottomNavigationBarItem(
          label: 'Categorías',
          icon: Icon(Icons.label_outline),
        ),
        BottomNavigationBarItem(
          label: 'Favoritos',
          icon: Icon(Icons.favorite_outline),
        ),
      ],
    );
  }
}
