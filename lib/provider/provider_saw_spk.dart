import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:spk_saw_whey_protein/data_model/api_response.dart';
import 'package:spk_saw_whey_protein/data_model/calculate_whey_protein_model/calculate_whey_protein_model.dart';
import 'package:spk_saw_whey_protein/data_model/list_whey_protein_model/add_whey_protein_model.dart';
import 'package:spk_saw_whey_protein/data_model/list_whey_protein_model/list_whey_protein_model.dart';
import 'package:spk_saw_whey_protein/data_model/list_whey_protein_model/update_list_whey_protein.dart';
import 'package:spk_saw_whey_protein/data_model/ranking_whey_protein_model/ranking_whey_protein_model.dart';

class SpkSawWheyProtein {
  SpkSawWheyProtein({Dio? dio}) 
      : _dio = dio ??
          Dio(BaseOptions(
            baseUrl: 'http://localhost:3000',
            connectTimeout: 30000,
            receiveTimeout: 3500,
          ));

  final Dio _dio;


  Future getListWheyProteinBySearch({
    String? price,
    String? protein,
    String? calories,
    String? variants,
    String? searchKeyword
   
  }) async {
    final _url = '/listwhey';
    Map<String, dynamic> queryParam = {};

    if (price != null) {
      queryParam['harga'] = price;
    }
    if (searchKeyword != null) {
      queryParam['search'] = searchKeyword;
    }
    if (protein != null) {
      queryParam['protein'] = protein;
    }
    if (calories != null) {
      queryParam['calories'] = calories;
    }
    if (variants != null) {
      queryParam['variants'] = variants;
    }
    try {
      final Response response = await _dio.get(
        _url,
        queryParameters: queryParam,
      );
      if (response.statusCode == 200) {
        if (response.data['message'] == 'Success') {
          print('TEST SUCCESS PROVIDER');
          // print(response.data);
          return GetListWheyProteinBySearchModel.fromJson(response.data);
        } else {
          print('Failed');
          return FailedResponse.fromJson(response.data);
        }
      }
      throw Exception(response.statusCode);
    } catch (exception) {
      print('$exception');
      throw Exception(exception);
    }
  }

  Future addNewListWheyData({
    required AddDataListWheyProtein listWheyProteinData,
  }) async {
    final _url = '/addwhey';
    try {
      final Response response = await _dio.post(
        _url,
        data: jsonEncode(listWheyProteinData),
      );
      if (response.statusCode == 200) {
        if (response.data['message'] == 'Success') {
          print('Post Success');
          return SuccessResponse.fromJson(response.data);
        } else {
          print('Post Failed');
          return FailedResponse.fromJson(response.data);
        }
      }
    } catch (exception) {
      print('$exception');
      throw Exception(exception);
    }
  }

  
  Future updateDataWheyListProtein({
    required UpdateDataListWheyProtein dataUpdated,
  }) async {
    final _url = '/updatewhey';
    try {
      final Response response = await _dio.put(
        _url,
        data: jsonEncode(dataUpdated),
      );
      if (response.statusCode == 200) {
        if (response.data['message'] == 'Success') {
          return SuccessResponse.fromJson(response.data);
        } else {
          return FailedResponse.fromJson(response.data);
        }
      }
      throw Exception(response.statusCode);
    } catch (exception) {
      print(exception);
      throw Exception(exception);
    }
  }

  Future deleteListWheyData({
    required int idWheyProtein,
  }) async {
    final _url = '/deletewhey';
    Map<String, dynamic> queryParam = {};
    queryParam['id'] = idWheyProtein;
    try {
      final Response response = await _dio.delete(
        _url,
        queryParameters: queryParam
      );
      if (response.statusCode == 200) {
        if (response.data['message'] == 'Success') {
          return SuccessResponse.fromJson(response.data);
        } else {
          return FailedResponse.fromJson(response.data);
        }
      }
      throw Exception(response.statusCode);
    } catch (exception) {
      print(exception);
      throw Exception(exception);
    }
  }

  Future getCalculateWheyBySearch({
    String? searchKeyword
  }) async {
    final _url = '/getcalculatewhey';
    Map<String, dynamic> queryParam = {};
    if (searchKeyword != null) {
      queryParam['search'] = searchKeyword;
    }
    try {
      final Response response = await _dio.get(
        _url,
        queryParameters: queryParam,
      );
      if (response.statusCode == 200) {
        if (response.data['message'] == 'Success') {
          print('TEST SUCCESS PROVIDER');
          // print(response.data);
          return GetCalculateWheyBySearchModel.fromJson(response.data);
        } else {
          print('Failed');
          return FailedResponse.fromJson(response.data);
        }
      }
      throw Exception(response.statusCode);
    } catch (exception) {
      print('$exception');
      throw Exception(exception);
    }
  }

  Future updateCalculateWhey() async {
    final _url = '/update_calculate_whey';
    try {
      final Response response = await _dio.put(
        _url,
      );
      if (response.statusCode == 200) {
        if (response.data['message'] == 'Success') {
          return SuccessResponse.fromJson(response.data);
        } else {
          return FailedResponse.fromJson(response.data);
        }
      }
      throw Exception(response.statusCode);
    } catch (exception) {
      print(exception);
      throw Exception(exception);
    }
  }

  Future getRankingWheyProteinBySearch({
    String? price,
    String? protein,
    String? calories,
    String? variants,
    String? others
   
  }) async {
    final _url = '/rankingwhey';

    Map<String, dynamic> queryParam = {};

    if (price != null) {
      queryParam['harga'] = price;
    }
    if (others != null) {
      queryParam['search'] = others;
    }
    if (protein != null) {
      queryParam['protein'] = protein;
    }
    if (calories != null) {
      queryParam['calories'] = calories;
    }
    if (variants != null) {
      queryParam['variants'] = variants;
    }
    try {
      final Response response = await _dio.get(
        _url,
        queryParameters: queryParam,
      );
      if (response.statusCode == 200) {
        if (response.data['message'] == 'Success') {
          print('TEST SUCCESS PROVIDER');
          // print(response.data);
          return GetRankingWheyProteinPack.fromJson(response.data);
        } else {
          print('Failed');
          return FailedResponse.fromJson(response.data);
        }
      }
      throw Exception(response.statusCode);
    } catch (exception) {
      print('$exception');
      throw Exception(exception);
    }
  }
}