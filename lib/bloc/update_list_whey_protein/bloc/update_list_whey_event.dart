part of 'update_list_whey_bloc.dart';

abstract class UpdateListWheyEvent extends Equatable {
  const UpdateListWheyEvent();

  @override
  List<Object> get props => [];
}

class UpdateListWheyByIdWheyProtein extends UpdateListWheyEvent {
  final UpdateDataListWheyProtein dataWheyUpdated;

  UpdateListWheyByIdWheyProtein ({
    required this.dataWheyUpdated
  });

  @override
  List<Object> get props => [
        dataWheyUpdated,
  ];

}
