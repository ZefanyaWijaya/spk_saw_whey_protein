part of 'list_whey_protein_get_by_search_bloc.dart';

abstract class ListWheyProteinGetBySearchState  {}

class ListWheyProteinGetBySearchInitial extends ListWheyProteinGetBySearchState {}

class ListWheyProteinGetBySearchLoading extends ListWheyProteinGetBySearchState {}

class ListWheyProteinGetBySearchDone extends ListWheyProteinGetBySearchState {
  final List<GetListWheyProteinData> listWheyProtein;

  ListWheyProteinGetBySearchDone({
    required this.listWheyProtein
  });
}

class ListWheyProteinGetBySearchFailed extends ListWheyProteinGetBySearchState {
  final String errorMessage;

  ListWheyProteinGetBySearchFailed ({
    required this.errorMessage
  });
}

