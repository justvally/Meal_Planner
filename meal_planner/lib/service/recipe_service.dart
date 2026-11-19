import '../model/ingredient.dart';
import '../model/meal_type.dart';
import '../model/recipe.dart';

class RecipeService {
  static const int minServings = 1;
  static const int maxServings = 20;

  final List<Recipe> recipes;

  RecipeService({List<Recipe>? recipes}) : recipes = recipes ?? [];

  Recipe addRecipe({
    required String name,
    required MealType mealType,
    required int servings,
    required Map<Ingredient, double> ingredients,
    List<String>? steps,
  }) {
    _validate(name: name, servings: servings, ingredients: ingredients);

    final recipe = Recipe(
      name: name.trim(),
      mealType: mealType,
      servings: servings,
      ingredients: ingredients,
      steps: steps,
    );
    recipes.add(recipe);
    return recipe;
  }

  void _validate({
    required String name,
    required int servings,
    required Map<Ingredient, double> ingredients,
  }) {
    if (name.trim().isEmpty) {
      throw ArgumentError('A recipe needs a name.');
    }
    if (ingredients.isEmpty) {
      throw ArgumentError('A recipe needs at least 1 ingredient.');
    }
    if (servings < minServings || servings > maxServings) {
      throw ArgumentError(
          'Servings must be between $minServings and $maxServings.');
    }
  }
}
