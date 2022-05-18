import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spk_saw_whey_protein/data_model/list_whey_protein_model/add_whey_protein_model.dart';
import 'package:spk_saw_whey_protein/repository/exceptions/list_ranking_whey_protein_exceptions.dart';
import 'package:spk_saw_whey_protein/repository/repository_saw_spk.dart';

part 'post_list_whey_protein_event.dart';
part 'post_list_whey_protein_state.dart';

class PostListWheyProteinBloc 
  extends Bloc<PostListWheyProteinEvent, PostListWheyProteinState> {
  PostListWheyProteinBloc() : super(PostListWheyProteinInitial()) {

    final ListWheyRepository _repository = ListWheyRepository();

    on<PostListNewWheyProtein>((event, emit) async {
      emit(PostListWheyProteinLoading());
      try {
        await _repository.addNewListWheyProduct(
          listWheyProteinDataRepo: event.newListWheyData
        );
        emit(PostListWheyProteinDone());
        print("finishdoneadd");
      } 
      catch (exception) {
        print("tryexception");
        String message = this.errorMessageList(exception);
        emit(PostListWheyProteinFailed(
          errorMessage:  message
        ));
      }
    });
  }

  String errorMessageList(Object exception) {
    if (exception is PostListWheyFailedErrorInternalServer) {
      return 'Internal Server Error (500). Mohon coba kembali di lain waktu';
    } else if (exception is PostListWheyUnknownErrorCode) {
      return 'Unknown Error Code. Segera hubungi pengembang website';
    } else {
      return 'Terjadi kesalahan, segera hubungi pengembang website';
    }
  }
}
