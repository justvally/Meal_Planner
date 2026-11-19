import 'meal_type.dart';
import 'planned_meal.dart';

class MealPlan {
  final List<PlannedMeal> meals;

  MealPlan({List<PlannedMeal>? meals}) : meals = meals ?? [];

  PlannedMeal? mealAt(DateTime date, MealType slot) {
    for (final meal in meals) {
      if (meal.slot == slot &&
          meal.date.year == date.year &&
          meal.date.month == date.month &&
          meal.date.day == date.day) {
        return meal;
      }
    }
    return null;
  }

  @override
  String toString() => 'MealPlan(${meals.length} meals)';
}
