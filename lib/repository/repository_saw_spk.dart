
import 'package:spk_saw_whey_protein/data_model/api_response.dart';
import 'package:spk_saw_whey_protein/data_model/calculate_whey_protein_model/calculate_whey_protein_model.dart';
import 'package:spk_saw_whey_protein/data_model/list_whey_protein_model/add_whey_protein_model.dart';
import 'package:spk_saw_whey_protein/data_model/list_whey_protein_model/delete_whey_protein_model.dart';
import 'package:spk_saw_whey_protein/data_model/list_whey_protein_model/update_list_whey_protein.dart';
import 'package:spk_saw_whey_protein/data_model/ranking_whey_protein_model/ranking_whey_protein_model.dart';
import 'package:spk_saw_whey_protein/provider/provider_saw_spk.dart';
import 'package:spk_saw_whey_protein/repository/exceptions/list_calculate_whey_exceptions.dart';
import 'package:spk_saw_whey_protein/repository/exceptions/list_ranking_whey_protein_exceptions.dart';
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
      print('test success repository');
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

  Future addNewListWheyProduct({
    required AddDataListWheyProtein listWheyProteinDataRepo,
  }) async {
    final response = await _apiProvider.addNewListWheyData(
      listWheyProteinData: listWheyProteinDataRepo
    );
    if (response is SuccessResponse) {
      print('test success repository add');
      return response;
    } else if (response is FailedResponse) {
      switch (response.errorKey) {
        case 'error_internal_server':
          throw PostListWheyFailedErrorInternalServer();
        default:
          print('Add List Whey Failed, unknown error key: ${response.errorKey}');
          throw PostListWheyUnknownErrorCode();
      }
    }
    throw PostListWheyFailed();
  }

  Future updateListWheyProtein({
    required UpdateDataListWheyProtein updateDataWhey,
  }) async {
    final response = await _apiProvider.updateDataWheyListProtein(
      dataUpdated: updateDataWhey
    );
    if (response is SuccessResponse) {
      print('test success repository update');
      return response;
    } else if (response is FailedResponse) {
      switch (response.errorKey) {
        case 'error_internal_server':
          throw UpdateListWheyFailedErrorInternalServer();
        default:
          print('Delete List Whey Failed, unknown error key: ${response.errorKey}');
          throw UpdateListWheyUnknownErrorCode();
      }
    }
    throw UpdateListWheyFailed();
  }

  Future deleteListWheyProteinRepo({
    required DeleteDataListWheyProtein deletDataWhey,
  }) async {
    final response = await _apiProvider.deleteListWheyData(
      deleteWheyData: deletDataWhey);
    if (response is SuccessResponse) {
      print('test success repository delete');
      return response;
    } else if (response is FailedResponse) {
      switch (response.errorKey) {
        case 'error_internal_server':
          throw DeleteListWheyFailedErrorInternalServer();
        default:
          print('Delete List Whey Failed, unknown error key: ${response.errorKey}');
          throw DeleteListWheyUnknownErrorCode();
      }
    }
    throw DeleteListWheyFailed();
  }

  Future getCalculateWheyBySearch({
    String? searchKeywordText,
  }) async {
    final response = await _apiProvider.getCalculateWheyBySearch(
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

  Future getListRankingWheyProtein({
    String? calories,
    String? price,
    String? protein,
    String? variants,
    String? othersIngredients

  }) async {
    final response = await _apiProvider.getRankingWheyProteinBySearch(
      calories: calories,
      price: price,
      protein: protein,
      variants: variants,
      others: othersIngredients
    );
    if(response is GetRankingWheyProteinPack) {
      print('test succes repository');
      // print(response.data);
      return response.data;
    } else if (response is FailedResponse){
      switch (response.errorKey) {
        case "error_internal_server" :
          throw GetListRankingWheyProteinErrorInternalServer();
        default :
          print('List Ranking Whey Protein By Search Failed, unknown error key: ${response.errorKey}');
          throw GetListRankingWheyUnknownErrorCode();
      }
    }
    throw GetListRankingWheyProteinFailed();
  }
}