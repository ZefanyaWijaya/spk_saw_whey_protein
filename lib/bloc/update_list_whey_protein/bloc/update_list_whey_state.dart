part of 'update_list_whey_bloc.dart';

abstract class UpdateListWheyState extends Equatable {
  const UpdateListWheyState();
  
  @override
  List<Object> get props => [];
}

class UpdateListWheyInitial extends UpdateListWheyState {}

class UpdateListWheyLoading extends UpdateListWheyState {}

class UpdateListWheyDone extends UpdateListWheyState {}

class UpdateListWheyFailed extends UpdateListWheyState {
  final String errorMessage;

  UpdateListWheyFailed ({
    required this.errorMessage
  });
}
