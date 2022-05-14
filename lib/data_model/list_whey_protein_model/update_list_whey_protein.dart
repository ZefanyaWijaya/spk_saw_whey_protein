class UpdateDataListWheyProtein {
  final int idWheyProtein;
  final String wheyProteinName;
  final int pricePerServing;
  final int proteinPerServing;
  final int caloriesPerServing;
  final int availableVariants;
  final int otherIngredients;
  final String moreDetails; 

  UpdateDataListWheyProtein ({
    required this.idWheyProtein,
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
      "id_whey_protein" : this.idWheyProtein,
      "whey_protein_name": this.wheyProteinName,
      "price_per_serving": this.pricePerServing,
      "protein_per_serving" : this.proteinPerServing,
      "calories_per_serving" : this.caloriesPerServing,
      "available_variants" : this.availableVariants,
      "other_ingredients" : this.otherIngredients,
      "details" : this.moreDetails,
    };
    return _map;
  }
}