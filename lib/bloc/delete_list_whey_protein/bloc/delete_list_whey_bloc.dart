import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spk_saw_whey_protein/data_model/list_whey_protein_model/delete_whey_protein_model.dart';
import 'package:spk_saw_whey_protein/repository/exceptions/list_ranking_whey_protein_exceptions.dart';
import 'package:spk_saw_whey_protein/repository/repository_saw_spk.dart';

part 'delete_list_whey_event.dart';
part 'delete_list_whey_state.dart';

class DeleteListWheyBloc extends Bloc<DeleteListWheyEvent, DeleteListWheyState> {
  DeleteListWheyBloc() : super(DeleteListWheyInitial()) {

    final ListWheyRepository _repository = ListWheyRepository();

    on<DeleteListWheyByIdWheyProtein>((event, emit) async {
      emit(DeleteListWheyLoading());
      try {
        await _repository.deleteListWheyProteinRepo(
          deleteDataWhey: event.deleteDataWhey
        );
        emit(DeleteListWheyDone());
      } catch (exceptions) {
        String message = this.errorMessageList(exceptions);
        emit(DeleteListWheyFailed(errorMessage: message));
      }
    });
  }

  String errorMessageList(Object exception) {
    if (exception is DeleteListWheyFailedErrorInternalServer) {
      return 'Internal Server Error (500). Mohon coba kembali di lain waktu';
    } else if (exception is DeleteListWheyUnknownErrorCode) {
      return 'Unknown Error Code. Segera hubungi pengembang aplikasi';
    } else {
      return 'Gagal Memuat Data';
    }
  }
}
