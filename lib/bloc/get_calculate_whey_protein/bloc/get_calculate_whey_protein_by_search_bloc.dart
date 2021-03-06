import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:spk_saw_whey_protein/bloc/update_calculate_whey_protein/bloc/put_calculate_whey_bloc.dart';
import 'package:spk_saw_whey_protein/data_model/calculate_whey_protein_model/calculate_whey_protein_model.dart';
import 'package:spk_saw_whey_protein/repository/exceptions/list_calculate_whey_exceptions.dart';
import 'package:spk_saw_whey_protein/repository/repository_saw_spk.dart';

part 'get_calculate_whey_protein_by_search_event.dart';
part 'get_calculate_whey_protein_by_search_state.dart';

class GetCalculateWheyProteinBySearchBloc 
  extends Bloc<GetCalculateWheyProteinBySearchEvent, GetCalculateWheyProteinBySearchState> {

  final ListWheyRepository _repository = ListWheyRepository();
  final PutCalculateWheyBloc blocUpdate ;
  late StreamSubscription calculateListener;


  GetCalculateWheyProteinBySearchBloc({
    required this.blocUpdate
  }) : super(GetCalculateWheyProteinBySearchInitial()) {
    on<GetCalculateWheyProteinBySearch>((event, emit) async {
      emit(GetCalculateWheyProteinSearchLoading());
      try {
        List<GetCalculateWheyProteinList> listCalculateWheyData = await _repository.getCalculateWheyBySearch(
          searchKeywordText: event.keyword
        );
        emit(GetCalculateWheyProteinSearchDone(
          listCalculateWhey: listCalculateWheyData
        ));
      }catch (exception) {
        String message = this.errorMessageList(exception);
        emit(GetCalculateWheyProteinSearchFailed(errorMessage: message));
      }
    });

    calculateListener = blocUpdate.stream.listen((state) {
      if(state is PutCalculateWheyDone) {
        add(GetCalculateWheyProteinBySearch(
          keyword: null
        ));
      }
    });
  }

  String errorMessageList(Object exception) {
    if (exception is GetCalculateWheyBySearchErrorInternalServer) {
      return 'Internal Server Error (500). Mohon coba kembali di lain waktu';
    } else if (exception is GetCalculateWheyUnknownErrorCode) {
      return 'Unknown Error Code. Segera hubungi pengembang website';
    } else {
      return 'Terjadi Kesalahan, segera hubungi pengembang website';
    }
  }
}
