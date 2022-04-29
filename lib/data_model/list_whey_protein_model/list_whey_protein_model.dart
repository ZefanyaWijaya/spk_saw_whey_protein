

import 'package:equatable/equatable.dart';

class GetListWheyProteinBySearchModel extends Equatable {
  final List<GetListWheyProteinData> data;

  GetListWheyProteinBySearchModel({
    required this.data
  });

  factory GetListWheyProteinBySearchModel.fromJson(Map<String,dynamic> json) {

    final List<GetListWheyProteinData> _temp = [];

    for (Map<String, dynamic> listWheyData in json['data']) {
      _temp.add(GetListWheyProteinData.fromJson(listWheyData));
    }

    return GetListWheyProteinBySearchModel(
      data: _temp,
    );
  }
  @override
  List<Object> get props => [
    data,
  ];
}

class GetListWheyProteinData extends Equatable {
  final int idWheyProtein;
  final String wheyProteinName;
  final int pricePerServing;
  final int proteinPerServing;
  final int caloriesPerServing;
  final int availableVariantProduct;
  final String moreDetail;

  GetListWheyProteinData({
    required this.idWheyProtein,
    required this.wheyProteinName,
    required this.pricePerServing,
    required this.proteinPerServing,
    required this.caloriesPerServing,
    required this.availableVariantProduct,
    required this.moreDetail

  });

  factory GetListWheyProteinData.fromJson(Map<String, dynamic> json) {
    return GetListWheyProteinData(
      idWheyProtein:  json['id_whey_protein'],
      wheyProteinName: json['whey_protein_name'], 
      pricePerServing: json['price_per_serving'], 
      proteinPerServing: json['protein_per_serving'],
      caloriesPerServing: json['calories_per_serving'],
      availableVariantProduct: json['available_variant_product'], 
      moreDetail: json['more_detail_link']
    );
  }

  @override List<Object> get props => [
    idWheyProtein,
    wheyProteinName,
    pricePerServing,
    proteinPerServing,
    caloriesPerServing,
    availableVariantProduct,
    moreDetail,
  ];
}