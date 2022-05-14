part of 'delete_list_whey_bloc.dart';

abstract class DeleteListWheyEvent extends Equatable {
  const DeleteListWheyEvent();

  @override
  List<Object> get props => [];
}

class DeleteListWheyByIdWheyProtein extends DeleteListWheyEvent {
  final DeleteDataListWheyProtein deleteDataWhey;

  DeleteListWheyByIdWheyProtein ({
    required this.deleteDataWhey
  });

  @override
  List<Object> get props => [
        deleteDataWhey
  ];
}
