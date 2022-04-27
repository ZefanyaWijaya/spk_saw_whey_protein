import 'package:flutter_bloc/flutter_bloc.dart';
part 'manage_page_saw_event.dart';
part 'manage_page_saw_state.dart';

class ManagePageSawBloc 
    extends Bloc<ManagePageSawEvent, ManagePageSawState> {
  ManagePageSawBloc() : super(ManagePageSawInitial()) {
    on<GoToListWheyPage>((event, emit) {
      emit(ManagePageSawLoading());
      try {
        emit(ManagePageSawDoneToListWheyPage());
      } catch (exception){
        emit(ManagePageSawFailed());
      }
    });
    on<GoToCalculateWheyPage>((event, emit) {
      emit(ManagePageSawLoading());
      try {
        emit(ManagePageSawDoneToCalculateWheyPage());
      } catch (exception){
        emit(ManagePageSawFailed());
      }
    });
    on<GoToRankingWheyPage>((event, emit) {
      emit(ManagePageSawLoading());
      try {
        emit(ManagePageSawDoneToRankingWheyPage());
      } catch (exception){
        emit(ManagePageSawFailed());
      }
    });
  }
}
