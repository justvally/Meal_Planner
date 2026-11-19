import '../model/meal_plan.dart';
import '../model/meal_type.dart';
import '../model/planned_meal.dart';
import '../model/recipe.dart';

class MealPlanService {
  final MealPlan mealPlan;

  MealPlanService({MealPlan? mealPlan}) : mealPlan = mealPlan ?? MealPlan();

  PlannedMeal planMeal({
    required DateTime date,
    required MealType slot,
    required Recipe recipe,
    required int servings,
    DateTime? today,
  }) {
    final now = today ?? DateTime.now();
    final todayDate = DateTime(now.year, now.month, now.day);
    final mealDate = DateTime(date.year, date.month, date.day);

    if (mealDate.isBefore(todayDate)) {
      throw ArgumentError('A meal cannot be planned for a day before today.');
    }
    if (servings < 1) {
      throw ArgumentError('Servings must be at least 1.');
    }

    final existing = mealPlan.mealAt(mealDate, slot);
    if (existing != null) {
      mealPlan.meals.remove(existing);
    }

    final meal = PlannedMeal(
      date: mealDate,
      slot: slot,
      recipe: recipe,
      servings: servings,
    );
    mealPlan.meals.add(meal);
    return meal;
  }
}
