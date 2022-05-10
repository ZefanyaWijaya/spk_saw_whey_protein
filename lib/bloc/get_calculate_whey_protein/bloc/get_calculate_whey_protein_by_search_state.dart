part of 'get_calculate_whey_protein_by_search_bloc.dart';

abstract class GetCalculateWheyProteinBySearchState {}

class GetCalculateWheyProteinBySearchInitial extends GetCalculateWheyProteinBySearchState {}

class GetCalculateWheyProteinSearchLoading extends GetCalculateWheyProteinBySearchState {}

class GetCalculateWheyProteinSearchDone extends GetCalculateWheyProteinBySearchState {
  final List<GetCalculateWheyProteinList> listCalculateWhey;

  GetCalculateWheyProteinSearchDone({
    required this.listCalculateWhey
  });
}

class GetCalculateWheyProteinSearchFailed extends GetCalculateWheyProteinBySearchState {
  final String errorMessage;

  GetCalculateWheyProteinSearchFailed ({
    required this.errorMessage
  });
}
