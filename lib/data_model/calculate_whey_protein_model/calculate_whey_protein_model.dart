

import 'package:equatable/equatable.dart';

class GetCalculateWheyBySearchModel extends Equatable {
  final String message;
  final List<GetCalculateWheyProteinList> data;

  GetCalculateWheyBySearchModel({
    required this.data,
    required this.message,
  });

  factory GetCalculateWheyBySearchModel.fromJson(Map<String,dynamic> json) {

    final List<GetCalculateWheyProteinList> _temp = [];

    for (Map<String, dynamic> calculateWheylistData in json['data']) {
      _temp.add(GetCalculateWheyProteinList.fromJson(calculateWheylistData));
    }

    return GetCalculateWheyBySearchModel(
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

class GetCalculateWheyProteinList extends Equatable {
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

  GetCalculateWheyProteinList({
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

  factory GetCalculateWheyProteinList.fromJson(Map<String, dynamic> json) {
    return GetCalculateWheyProteinList(
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