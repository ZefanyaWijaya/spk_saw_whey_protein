part of 'manage_page_saw_bloc.dart';


abstract class ManagePageSawState {
  const ManagePageSawState();

  @override
  List<Object> get props => [];
}

class ManagePageSawInitial extends ManagePageSawState {}

class ManagePageSawLoading extends ManagePageSawState {}

class ManagePageSawDoneToListWheyPage extends ManagePageSawState {}

class ManagePageSawDoneToCalculateWheyPage extends ManagePageSawState{}

class ManagePageSawDoneToRankingWheyPage extends ManagePageSawState {}

class ManagePageSawFailed extends ManagePageSawState{}
