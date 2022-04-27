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
         print("LIST WHEY PAGE DONE");
      } catch (exception){
        emit(ManagePageSawFailed());
      }
    });
    on<GoToCalculateWheyPage>((event, emit) {
      emit(ManagePageSawLoading());
      try {
        emit(ManagePageSawDoneToCalculateWheyPage());
         print("CALCULATE WHEY PAGE DONE");
      } catch (exception){
        emit(ManagePageSawFailed());
      }
    });
    on<GoToRankingWheyPage>((event, emit) {
      emit(ManagePageSawLoading());
      try {
        print("Befor ranking whey page");
        emit(ManagePageSawDoneToRankingWheyPage());
        print("RANKING WHEY PAGE DONE");
      } catch (exception){
        emit(ManagePageSawFailed());
      }
    });
  }
}
