part of 'put_calculate_whey_bloc.dart';

abstract class PutCalculateWheyState extends Equatable {
  const PutCalculateWheyState();
  
  @override
  List<Object> get props => [];
}

class PutCalculateWheyInitial extends PutCalculateWheyState {}

class PutCalculateWheyLoading extends PutCalculateWheyState {}

class PutCalculateWheyDone extends PutCalculateWheyState {}

class PutCalculateWheyFailed extends PutCalculateWheyState {
  final String errorMessage;

  const PutCalculateWheyFailed({
    required this.errorMessage
  });
}
