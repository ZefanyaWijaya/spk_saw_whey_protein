part of 'manage_page_saw_bloc.dart';

abstract class ManagePageSawEvent {
  const ManagePageSawEvent();

  @override
  List<Object> get props => [];
}

class GoToListWheyPage extends ManagePageSawEvent {}

class GoToCalculateWheyPage extends ManagePageSawEvent {}

class GoToRankingWheyPage extends ManagePageSawEvent {}
