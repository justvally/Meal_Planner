import 'package:uuid/uuid.dart';

import 'meal_type.dart';
import 'recipe.dart';

const _uuid = Uuid();

class PlannedMeal {
  final String id;
  final DateTime date;
  final MealType slot;
  final Recipe recipe;
  final int servings;

  bool isCooked;

  PlannedMeal({
    String? id,
    required DateTime date,
    required this.slot,
    required this.recipe,
    required this.servings,
    this.isCooked = false,
  })  : id = id ?? _uuid.v4(),
        date = DateTime(date.year, date.month, date.day);

  @override
  String toString() =>
      'PlannedMeal(${recipe.name}, ${slot.name} on '
      '${date.toIso8601String().substring(0, 10)}, $servings servings'
      '${isCooked ? ", cooked" : ""})';
}
