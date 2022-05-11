part of 'get_list_ranking_whey_bloc.dart';

abstract class GetListRankingWheyState {}

class GetListRankingWheyInitial extends GetListRankingWheyState {}

class GetListRankingWheyLoading extends GetListRankingWheyState {}

class GetListRankingWheyDone extends GetListRankingWheyState {
  final List<GetListRankingWheyProteinData> listDataRanking;

  GetListRankingWheyDone ({
    required this.listDataRanking
  });
}

class GetListRankingWheyFailed extends GetListRankingWheyState {
  final String errorMessage;

  GetListRankingWheyFailed ({
    required this.errorMessage
  });

}


