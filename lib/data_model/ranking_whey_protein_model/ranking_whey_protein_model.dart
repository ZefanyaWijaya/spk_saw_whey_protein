
import 'package:equatable/equatable.dart';

class GetRankingWheyProteinPack extends Equatable {
  final String message;
  final List<GetListRankingWheyProteinData> data;

  GetRankingWheyProteinPack({
    required this.data,
    required this.message,
  });

  factory GetRankingWheyProteinPack.fromJson(Map<String,dynamic> json) {

    final List<GetListRankingWheyProteinData> _temp = [];

    for (Map<String, dynamic> listRankingWheyData in json['data']) {
      _temp.add(GetListRankingWheyProteinData.fromJson(listRankingWheyData));
    }

    return GetRankingWheyProteinPack(
      message: json['message'],
      data: _temp,
    );
  }
  @override
  List<Object> get props => [
    message,
    data,
  ];
}

class GetListRankingWheyProteinData extends Equatable {
  final int idCalculateSaw;
  final int idWheyProtein;
  final int otherIngredients;
  final double scoreSaw;
  final String wheyProteinName;
  final int pricePerServing;
  final int proteinPerServing;
  final int caloriesPerServing;
  final int availableVariantProduct;
  final String moreDetail;

  GetListRankingWheyProteinData({
    required this.idCalculateSaw,
    required this.idWheyProtein,
    required this.otherIngredients,
    required this.scoreSaw,
    required this.wheyProteinName,
    required this.pricePerServing,
    required this.proteinPerServing,
    required this.caloriesPerServing,
    required this.availableVariantProduct,
    required this.moreDetail

  });

  factory GetListRankingWheyProteinData.fromJson(Map<String, dynamic> json) {
    return GetListRankingWheyProteinData(
      idCalculateSaw: json['id_calculate_saw'],
      idWheyProtein:  json['id_whey_protein'],
      otherIngredients: json['other_ingredients'],
      scoreSaw: json['score_saw'],
      wheyProteinName: json['whey_protein_name'], 
      pricePerServing: json['price_per_serving'], 
      proteinPerServing: json['protein_per_serving'],
      caloriesPerServing: json['calories_per_serving'],
      availableVariantProduct: json['available_variant_product'], 
      moreDetail: json['more_detail_link']
    );
  }

  @override List<Object> get props => [
    idCalculateSaw,
    idWheyProtein,
    otherIngredients,
    scoreSaw,
    wheyProteinName,
    pricePerServing,
    proteinPerServing,
    caloriesPerServing,
    availableVariantProduct,
    moreDetail,
  ];
}