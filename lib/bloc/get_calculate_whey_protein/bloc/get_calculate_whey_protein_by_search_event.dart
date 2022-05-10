part of 'get_calculate_whey_protein_by_search_bloc.dart';

abstract class GetCalculateWheyProteinBySearchEvent {}

class GetCalculateWheyProteinBySearch extends GetCalculateWheyProteinBySearchEvent{
  final String? keyword;

  GetCalculateWheyProteinBySearch ({
    required this.keyword
  });
}
