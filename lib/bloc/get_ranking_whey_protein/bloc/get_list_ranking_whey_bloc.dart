import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:spk_saw_whey_protein/bloc/get_ranking_whey_protein/cubit/cubit/settings_ranking_whey_cubit.dart';
import 'package:spk_saw_whey_protein/data_model/ranking_whey_protein_model/ranking_whey_protein_model.dart';
import 'package:spk_saw_whey_protein/repository/exceptions/list_ranking_whey_protein_exceptions.dart';
import 'package:spk_saw_whey_protein/repository/repository_saw_spk.dart';
part 'get_list_ranking_whey_event.dart';
part 'get_list_ranking_whey_state.dart';

class GetListRankingWheyBloc 
  extends Bloc<GetListRankingWheyEvent, GetListRankingWheyState> {

  final ListWheyRepository _repository = ListWheyRepository();
  final SettingsRankingWheyCubit settingsCubit;
  late StreamSubscription settingsListener;

  GetListRankingWheyBloc({
    required this.settingsCubit
  }) : super(GetListRankingWheyInitial()) {


    on<GetListRankingWheyProtein>((event, emit) async {
      emit(GetListRankingWheyLoading());
      try {
        List<GetListRankingWheyProteinData> listRankingWhey = await _repository.getListRankingWheyProtein(
          calories: settingsCubit.calories,
          price: settingsCubit.price,
          protein: settingsCubit.protein,
          variants: settingsCubit.variants,
          othersIngredients: settingsCubit.others
        );
        emit(GetListRankingWheyDone(
          listDataRanking: listRankingWhey
        ));
      }catch (exception) {
        String message = this.errorMessageList(exception);
        emit(GetListRankingWheyFailed(errorMessage: message));
      }
    });

     settingsListener = settingsCubit.stream.listen((state) {
      if(state is SettingsRankingWheyDone) {
        add(GetListRankingWheyProtein());
      }
    });
  }

  String errorMessageList(Object exception) {
    if (exception is GetListRankingWheyProteinErrorInternalServer) {
      return 'Internal Server Error (500). Mohon coba kembali di lain waktu';
    } else if (exception is GetListRankingWheyUnknownErrorCode) {
      return 'Unknown Error Code. Segera hubungi pengembang aplikasi';
    } else {
      return 'Gagal Memuat Data';
    }
  }
}
