
part 'manage_page_saw_event.dart';
part 'manage_page_saw_state.dart';

class ManagePageSawBloc 
    extends Bloc<ManagePageSawEvent, ManagePageSawState> {
  ManagePageSawBloc() : super(ManagePageSawInitial()) {
    on<ManagePageSawEvent>((event, emit) {
      
    });
  }
}
