class AddDataListWheyProtein {
  final String wheyProteinName;
  final int pricePerServing;
  final int proteinPerServing;
  final int caloriesPerServing;
  final int availableVariants;
  final int otherIngredients;
  final String moreDetails;

  AddDataListWheyProtein({
    required this.wheyProteinName,
    required this.pricePerServing,
    required this.proteinPerServing,
    required this.caloriesPerServing,
    required this.availableVariants,
    required this.otherIngredients,
    required this.moreDetails
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _map = {
      "whey_protein_name": this.wheyProteinName,
      "price_per_serving": this.pricePerServing,
      "protein_per_serving" : this.proteinPerServing,
      "calories_per_serving" : caloriesPerServing,
      "available_variants" : availableVariants,
      "other_ingredients" : otherIngredients,
      "details" : moreDetails,
    };
    return _map;
  }
}
