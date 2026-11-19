import 'ingredient.dart';

class PantryBatch {
  final String id;
  final Ingredient ingredient;
  double quantity;
  final DateTime? expiryDate;
  final DateTime addedDate;

  PantryBatch({
    required this.id,
    required this.ingredient,
    required this.quantity,
    this.expiryDate,
    required this.addedDate,
  });
}
