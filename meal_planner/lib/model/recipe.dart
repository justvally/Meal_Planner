import 'package:uuid/uuid.dart';

import 'ingredient.dart';
import 'meal_type.dart';

const _uuid = Uuid();

class Recipe {
  final String id;
  final bool isStarter;

  String name;
  MealType mealType;
  int servings;
  Map<Ingredient, double> ingredients;
  List<String> steps;

  Recipe({
    String? id,
    this.isStarter = false,
    required this.name,
    required this.mealType,
    required this.servings,
    required Map<Ingredient, double> ingredients,
    List<String>? steps,
  })  : id = id ?? _uuid.v4(),
        ingredients = Map.of(ingredients),
        steps = List.of(steps ?? []);

  @override
  String toString() =>
      'Recipe($name, ${mealType.name}, $servings servings, '
      '${ingredients.length} ingredients${isStarter ? ", starter" : ""})';
}
