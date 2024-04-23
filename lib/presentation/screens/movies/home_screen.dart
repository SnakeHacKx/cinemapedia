import 'package:flutter/material.dart';

import '../../views/views.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  final int pageIndex;

  final viewRoutes = const <Widget>[
    HomeView(),
    SizedBox(),
    FavoritesView(),
  ];

  const HomeScreen({super.key, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation(currentIndex: pageIndex),
    );
  }
}


// TODO: usar esto para el home de FAP, o algo parecido pues
  // return Column(
  //     children: [
  //       const CustomAppBar(),
  //       Expanded(
  //         child: ListView.builder(
  //           itemCount: nowPlayingMovies.length,
  //           itemBuilder: (context, index) {
  //             final movie = nowPlayingMovies[index];
  //             return ListTile(
  //               title: Text(movie.title),
  //             );
  //           },
  //         ),
  //       ),
  //     ],
  //   );