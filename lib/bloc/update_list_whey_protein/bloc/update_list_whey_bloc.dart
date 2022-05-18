import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spk_saw_whey_protein/data_model/list_whey_protein_model/update_list_whey_protein.dart';
import 'package:spk_saw_whey_protein/repository/exceptions/list_ranking_whey_protein_exceptions.dart';
import 'package:spk_saw_whey_protein/repository/repository_saw_spk.dart';
part 'update_list_whey_event.dart';
part 'update_list_whey_state.dart';

class UpdateListWheyBloc extends Bloc<UpdateListWheyEvent, UpdateListWheyState> {
  UpdateListWheyBloc() : super(UpdateListWheyInitial()) {

    final ListWheyRepository _repository = ListWheyRepository();

    on<UpdateListWheyByIdWheyProtein>((event, emit) async {
      emit(UpdateListWheyLoading());
      try {
        await _repository.updateListWheyProtein(
          updateDataWhey: event.dataWheyUpdated
        );
        emit(UpdateListWheyDone());
      } catch (exception) {
        String message = this.errorMessageList(exception);
        emit(UpdateListWheyFailed(errorMessage: message));
      } 
    });
  }

  String errorMessageList(Object exception) {
  if (exception is UpdateListWheyFailedErrorInternalServer) {
    return 'Internal Server Error (500). Mohon coba kembali di lain waktu';
  } else if (exception is UpdateListWheyUnknownErrorCode) {
    return 'Unknown Error Code. Segera hubungi pengembang webiste';
  } else {
    return 'Terjadi Kesalahan, segera hubungi pengembang website';
  }
}
}
