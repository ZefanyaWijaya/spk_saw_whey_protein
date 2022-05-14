part of 'delete_list_whey_bloc.dart';

abstract class DeleteListWheyEvent extends Equatable {
  const DeleteListWheyEvent();

  @override
  List<Object> get props => [];
}

class DeleteListWheyByIdWheyProtein extends DeleteListWheyEvent {
  final int deleteDataWheyId;

  DeleteListWheyByIdWheyProtein ({
    required this.deleteDataWheyId
  });

  @override
  List<Object> get props => [
        deleteDataWheyId
  ];
}
