import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:spk_saw_whey_protein/bloc/get_list_whey_protein/settingsCubit/cubit/list_whey_protein_settings_cubit.dart';
import 'package:spk_saw_whey_protein/data_model/list_whey_protein_model/list_whey_protein_model.dart';
import 'package:spk_saw_whey_protein/repository/exceptions/list_whey_protein_exceptions.dart';
import 'package:spk_saw_whey_protein/repository/repository_saw_spk.dart';

part 'list_whey_protein_get_by_search_event.dart';
part 'list_whey_protein_get_by_search_state.dart';

class ListWheyProteinGetBySearchBloc 
  extends Bloc<ListWheyProteinGetBySearchEvent, ListWheyProteinGetBySearchState> {

  final ListWheyRepository _repository = ListWheyRepository();
  final ListWheyProteinSettingsCubit settingsCubit;
  late StreamSubscription settingsListener;

  ListWheyProteinGetBySearchBloc({
    required this.settingsCubit
  }) : super(ListWheyProteinGetBySearchInitial()) {

    on<ListWheyProteinGetBySearchAndFilter>((event, emit) async {
      emit(ListWheyProteinGetBySearchLoading());
      try {
        List<GetListWheyProteinData> listWheyProteinData = await _repository.getListWheyBySearchRepo(
          calories: settingsCubit.calories,
          price: settingsCubit.price,
          protein: settingsCubit.protein,
          variants: settingsCubit.variants,
          searchKeywordText: settingsCubit.keyword
        );
        emit(ListWheyProteinGetBySearchDone(
          listWheyProtein: listWheyProteinData,
        ));
      } catch (exception) {
        String message = this.errorMessageList(exception);
        emit(ListWheyProteinGetBySearchFailed(errorMessage: message));
      }
    });

    settingsListener = settingsCubit.stream.listen((state) {
      if(state is ListWheyProteinSettingsDone) {
        add(ListWheyProteinGetBySearchAndFilter());
      }
    });
  }

  String errorMessageList(Object exception) {
    if (exception is GetListWheyErrorInternalServer) {
      return 'Internal Server Error (500). Mohon coba kembali di lain waktu';
    } else if (exception is GetListWheyUnknownErrorCode) {
      return 'Unknown Error Code. Segera hubungi pengembang aplikasi';
    } else {
      return 'Gagal Memuat Data';
    }
  }
}
