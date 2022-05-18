import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spk_saw_whey_protein/repository/exceptions/list_calculate_whey_exceptions.dart';
import 'package:spk_saw_whey_protein/repository/repository_saw_spk.dart';

part 'put_calculate_whey_event.dart';
part 'put_calculate_whey_state.dart';

class PutCalculateWheyBloc 
  extends Bloc<PutCalculateWheyEvent, PutCalculateWheyState> {
  PutCalculateWheyBloc() : super(PutCalculateWheyInitial()) {

    final ListWheyRepository _repository = ListWheyRepository();
    
    on<PutCalculateWheyTriggerCalculateScore>((event, emit) async {
      emit(PutCalculateWheyLoading());
      try{
        await _repository.updateCalculateListWheyProtein(
          // no need param just trigger function get in node js
          //function will get list calculate first and count the score
        );
        emit(PutCalculateWheyDone());
      } catch (exception){
        print(exception);
        String message = this.errorMessageList(exception);
        emit(PutCalculateWheyFailed(errorMessage: message));
      }
    });
  }

  String errorMessageList(Object exception) {
    if (exception is UpdateCalculateWheyErrorInternalServer) {
      return 'Internal Server Error (500). Mohon coba kembali di lain waktu';
    } else if (exception is UpdateCalculateWheyUnknownErrorCode) {
      return 'Unknown Error Code. Segera hubungi pengembang website';
    } else {
      return 'Terjadi Kesalahan, segera hubungi pengembang website';
    }
  }
}
