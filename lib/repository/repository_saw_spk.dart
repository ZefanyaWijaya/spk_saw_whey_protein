
import 'package:dio/dio.dart';
import 'package:spk_saw_whey_protein/data_model/api_response.dart';
import 'package:spk_saw_whey_protein/data_model/calculate_whey_protein_model/calculate_whey_protein_model.dart';
import 'package:spk_saw_whey_protein/provider/provider_saw_spk.dart';
import 'package:spk_saw_whey_protein/repository/exceptions/list_calculate_whey_exceptions.dart';
import 'package:spk_saw_whey_protein/repository/exceptions/list_whey_protein_exceptions.dart';

import '../data_model/list_whey_protein_model/list_whey_protein_model.dart';

class ListWheyRepository {
  ListWheyRepository({SpkSawWheyProtein? listWheyProvider}) 
  : _apiProvider = listWheyProvider ?? SpkSawWheyProtein();

  final SpkSawWheyProtein _apiProvider;


  Future getListWheyBySearchRepo({
    String? calories,
    String? price,
    String? protein,
    String? searchKeywordText,
    String? variants

  }) async {
    final response = await _apiProvider.getListWheyProteinBySearch(
      calories: calories,
      price: price,
      protein: protein,
      searchKeyword: searchKeywordText,
      variants: variants
    );
    if(response is GetListWheyProteinBySearchModel) {
      print('test succes repository');
      // print(response.data);
      return response.data;
    } else if (response is FailedResponse){
      switch (response.errorKey) {
        case "error_internal_server" :
          throw GetListWheyErrorInternalServer();
        default :
          print('List Whey Protein By Search Failed, unknown error key: ${response.errorKey}');
          throw GetListWheyUnknownErrorCode();
      }
    }
    throw GetListWheyBySearchFailed();
  }

  Future getCalculateWheyBySearch({
    String? searchKeywordText,
  }) async {
    final response = await _apiProvider.getListWheyProteinBySearch(
      searchKeyword: searchKeywordText,
    );
    if(response is GetCalculateWheyBySearchModel) {
      print('test succes repository');
      // print(response.data);
      return response.data;
    } else if (response is FailedResponse){
      switch (response.errorKey) {
        case "error_internal_server" :
          throw GetCalculateWheyBySearchErrorInternalServer();
        default :
          print('Calculate Whey Protein By Search Failed, unknown error key: ${response.errorKey}');
          throw GetCalculateWheyUnknownErrorCode();
      }
    }
    throw GetCalculateWheyBySearchFailed();
  }
}