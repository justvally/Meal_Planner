import '../model/ingredient.dart';
import '../model/pantry.dart';
import '../model/pantry_batch.dart';
import '../model/unit.dart';

class PantryService {
  final Pantry pantry;
  int _nextId = 1;
  PantryService(this.pantry);

  // Creates a new ingredient. The name cannot be empty.
  Ingredient createIngredient(String name, Unit unit) {
    if (name.trim().isEmpty) {
      throw Exception('Ingredient name cannot be empty');
    }

    Ingredient ingredient = Ingredient(
      id: 'ing$_nextId',
      name: name.trim(),
      unit: unit,
    );
    _nextId++;
    return ingredient;
  }

  PantryBatch addBatch({
    required Ingredient ingredient,
    required double quantity,
    DateTime? expiryDate}) {
      
    if (quantity <= 0) {
      throw Exception('Quantity must be more than 0');
    }

    PantryBatch newBatch = PantryBatch(
      id: 'batch$_nextId',
      ingredient: ingredient,
      quantity: quantity,
      expiryDate: expiryDate,
      addedDate: DateTime.now(),
    );
    _nextId++;
    pantry.batches.add(newBatch);
    return newBatch;
  }
}