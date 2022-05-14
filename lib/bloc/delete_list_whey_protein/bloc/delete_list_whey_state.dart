part of 'delete_list_whey_bloc.dart';

abstract class DeleteListWheyState extends Equatable {
  const DeleteListWheyState();
  
  @override
  List<Object> get props => [];
}

class DeleteListWheyInitial extends DeleteListWheyState {}

class DeleteListWheyLoading extends DeleteListWheyState {}

class DeleteListWheyDone extends DeleteListWheyState {}

class DeleteListWheyFailed extends DeleteListWheyState {
  final String errorMessage;

  DeleteListWheyFailed ({
    required this.errorMessage
  });

  
}
