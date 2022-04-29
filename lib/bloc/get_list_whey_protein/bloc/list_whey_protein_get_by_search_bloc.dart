import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'list_whey_protein_get_by_search_event.dart';
part 'list_whey_protein_get_by_search_state.dart';

class ListWheyProteinGetBySearchBloc extends Bloc<ListWheyProteinGetBySearchEvent, ListWheyProteinGetBySearchState> {
  ListWheyProteinGetBySearchBloc() : super(ListWheyProteinGetBySearchInitial()) {
    on<ListWheyProteinGetBySearchEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
