part of 'put_calculate_whey_bloc.dart';

abstract class PutCalculateWheyEvent extends Equatable {
  const PutCalculateWheyEvent();

  @override
  List<Object> get props => [];
}

class PutCalculateWheyTriggerCalculateScore extends PutCalculateWheyEvent {} 
