import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:spk_saw_whey_protein/data_model/list_whey_protein_model/list_whey_protein_model.dart';
import 'package:spk_saw_whey_protein/repository/repository_saw_spk.dart';

part 'list_whey_protein_get_by_search_event.dart';
part 'list_whey_protein_get_by_search_state.dart';

class ListWheyProteinGetBySearchBloc 
  extends Bloc<ListWheyProteinGetBySearchEvent, ListWheyProteinGetBySearchState> {

  final ListWheyRepository _repository = ListWheyRepository();

  ListWheyProteinGetBySearchBloc() : super(ListWheyProteinGetBySearchInitial()) {
    on<ListWheyProteinGetBySearchEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
