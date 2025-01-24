import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen({required this.favoriteMeals, super.key});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text(
          'You have no favorites yet - start adding some!',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      );
    }
    return ListView.builder(
      itemCount: favoriteMeals.length,
      itemBuilder: (ctx, index) {
        return MealItem(
          id: favoriteMeals[index].id,
          title: favoriteMeals[index].title,
          imageUrl: favoriteMeals[index].imageUrl,
          duration: favoriteMeals[index].duration,
          complexity: favoriteMeals[index].complexity,
          affordability: favoriteMeals[index].affordability,
          removeItem: () => {},
        );
      },
    );
  }
}
