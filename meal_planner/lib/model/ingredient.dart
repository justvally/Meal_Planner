enum Unit { g, ml, pcs }

class Ingredient {
  final String id;
  final String name;
  final Unit unit;

  Ingredient({required this.id, required this.name, required this.unit});
}
