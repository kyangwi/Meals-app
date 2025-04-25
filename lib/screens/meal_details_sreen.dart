import 'package:flutter/material.dart';
import 'package:multipageapp/data/dummy_data.dart';
import 'package:multipageapp/widgets/appBar.dart';

class MealDetailScreen extends StatelessWidget {
  final Function toggleFavorites;
  final Function(String) isFavorite;
  const MealDetailScreen(this.toggleFavorites, this.isFavorite);

  static const routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).primaryColor),
          const SizedBox(width: 20),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: Colors.black
                ),
          ),
        ],
      ),
    );
  }

  Widget buildRoundedCard({required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: myAppBar(selectedMeal.title),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Main image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.network(
                selectedMeal.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // Ingredients Section
            buildSectionTitle(context, "Ingredients", Icons.kitchen),
            buildRoundedCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: selectedMeal.ingredients
                    .map(
                      (ingredient) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          children: [
                            const Icon(Icons.check_circle_outline, color: Colors.green, size: 20),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                ingredient,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      fontSize: 16,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),

            // Steps Section
            buildSectionTitle(context, "Steps", Icons.format_list_numbered),
            buildRoundedCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: selectedMeal.steps
                    .asMap()
                    .entries
                    .map(
                      (entry) => Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 14,
                              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
                              child: Text(
                                '${entry.key + 1}',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                entry.value,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      fontSize: 15,
                                      height: 1.5,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),

      // Favorite Floating Button
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorites(mealId),
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
          color: Colors.white,
        ),
      ),
    );
  }
}
