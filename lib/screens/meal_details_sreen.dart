import 'package:flutter/material.dart';
import 'package:multipageapp/data/dummy_data.dart';
import 'package:multipageapp/widgets/appBar.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  static const routeName = '/meal-detail';

  Widget buildSectionTitle(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
      ),
    );
  }

  Widget buildRoundedCard({required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          )
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
      backgroundColor: Theme.of(context).canvasColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section
            ClipRRect(
              borderRadius: const BorderRadius.only(
                // bottomLeft: Radius.circular(24),
                // bottomRight: Radius.circular(24),
              ),
              child: Image.network(
                selectedMeal.imageUrl,
                height: 260,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // Ingredients title
            buildSectionTitle("Ingredients", context),
            buildRoundedCard(
              child: Column(
                children: selectedMeal.ingredients
                    .map(
                      (ingredient) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Row(
                          children: [
                            const Icon(Icons.circle, size: 8, color: Colors.black54),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                ingredient,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),

            // Steps title
            buildSectionTitle("Steps", context),
            buildRoundedCard(
              child: Column(
                children: selectedMeal.steps
                    .asMap()
                    .entries
                    .map(
                      (entry) => Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 14,
                                backgroundColor: Theme.of(context).primaryColorLight,
                                child: Text(
                                  '${entry.key + 1}',
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    entry.value,
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (entry.key != selectedMeal.steps.length - 1)
                            const Divider(height: 20),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
