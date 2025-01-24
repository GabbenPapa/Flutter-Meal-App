// import 'package:flutter/material.dart';
// import 'categories_screen.dart';
// import 'favorites_screen.dart';

// class TabsScreen extends StatefulWidget {
//   const TabsScreen({super.key});

//   @override
//   State<TabsScreen> createState() => _TabsScreenState();
// }

// class _TabsScreenState extends State<TabsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       initialIndex: 0,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Meals'),
//           bottom: const TabBar(
//             labelColor: Colors.white,
//             unselectedLabelColor: Colors.white54,
//             indicatorColor: Colors.white,
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: 'Categories',
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: 'Favorites',
//               ),
//             ],
//           ),
//         ),
//         body: const TabBarView(
//           children: [
//             CategoriesScreen(),
//             FavoritesScreen(),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import 'categories_screen.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen({required this.favoriteMeals, super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      {'page': const CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavoritesScreen(favoriteMeals: widget.favoriteMeals),
        'title': 'Favorites'
      },
    ];
  }

  void _selectPage(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_currentPageIndex]['title'] as String),
      ),
      drawer: const MainDrawer(),
      body: _pages[_currentPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.tertiary,
        currentIndex: _currentPageIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
