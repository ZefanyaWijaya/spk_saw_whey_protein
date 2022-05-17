import 'package:bloc/bloc.dart';
part 'settings_ranking_whey_state.dart';

class SettingsRankingWheyCubit extends Cubit<SettingsRankingWheyState> {
  SettingsRankingWheyCubit() : super(SettingsRankingWheyInitial());

  String price = "";
  String protein = "";
  String calories ="";
  String variants ="";
  String others= "";

  void getKategoriRankingPriceFilter(String priceCategory){
    emit(SettingsRankingWheyLoading());
    if(priceCategory == "Rp 0 - Rp 5.000") {
      price = "a";
    } else if (priceCategory == "Rp 5.001 - Rp 10.000") {
      price = "b";
    } else if (priceCategory == "Rp 10.001 - Rp 15.000") {
      price ="c";
    } else if (priceCategory == "Rp 15.001 - Rp 20.000") {
      price = "d";
    } else if (priceCategory == "Rp 20.001 - Rp 25.000") {
      price = "e";
    } else if (priceCategory == "Rp 25.001 - Rp 30.000") {
      price = "f";
    } else if (priceCategory == "Lebih dari Rp 30.000") {
      price = "g";
    } else {
      price = "";
    }
    // emit(SettingsRankingWheyDone());
  }

  void getKategoriRankingProtein(String proteinCategory) {
    emit(SettingsRankingWheyLoading());
    if(proteinCategory == "0 gr - 5 gr") {
      protein = "a";
    } else if (proteinCategory == "6 gr - 10 gr") {
      protein = "b";
    } else if (proteinCategory == "11 gr - 15 gr") {
      protein = "c";
    } else if (proteinCategory == "16 gr - 20 gr") {
      protein = "d";
    } else if (proteinCategory == "21 gr - 25 gr") {
      protein = "e";
    } else if (proteinCategory == "26 gr - 30 gr") {
      protein = "f";
    } else if (proteinCategory == "Lebih dari 30 gr") {
      protein = "g";
    } else {
      protein = "";
    }
    // emit(SettingsRankingWheyDone());
  }

  void getKategoriRankingCalories (String caloriesCategory) {
    emit(SettingsRankingWheyLoading());
    if(caloriesCategory == "0 calories - 100 calories") {
      calories = "a";
    } else if (caloriesCategory == "101 calories - 125 calories") {
      calories = "b";
    } else if (caloriesCategory == "126 calories - 150 calories") {
      calories = "c";
    } else if (caloriesCategory == "151 calories - 175 calories") {
      calories = "d";
    } else if (caloriesCategory == "176 calories - 200 calories") {
      calories = "e";
    } else if (caloriesCategory == "201 calories - 225 calories") {
      calories = "f";
    } else if (caloriesCategory == "226 calories - 250 calories") {
      calories = "g";
    } else if (caloriesCategory == "Lebih dari 250 calories" ) {
      calories = "h";
    } else {
      calories = "";
    }
    // emit(SettingsRankingWheyDone());
  }

  void getKategoriRankingVariants (String variantsCategory) {
    emit(SettingsRankingWheyLoading());
    if(variantsCategory == "1 Variant Rasa") {
      variants = "a";
    } else if (variantsCategory == "2 Variant Rasa") {
      variants = "b";
    } else if (variantsCategory == "3 Variant Rasa") {
      variants = "c";
    } else if (variantsCategory == "4 Variant Rasa") {
      variants = "d";
    } else if (variantsCategory == "5 Variant Rasa") {
      variants = "e";
    } else if (variantsCategory == "Lebih dari 5 Variant Rasa") {
      variants = "f";
    } else {
      variants = "";
    }
    // emit(SettingsRankingWheyDone());
  }

  void getKategoriRankingOthersIngredients (String othersCategory) {
    emit(SettingsRankingWheyLoading());
    if(othersCategory == "1 Kandungan Bahan Lain") {
      variants = "a";
    } else if (othersCategory == "2 Kandungan Bahan Lain") {
      variants = "b";
    } else if (othersCategory == "3 Kandungan Bahan Lain") {
      variants = "c";
    } else if (othersCategory == "4 Kandungan Bahan Lain") {
      variants = "d";
    } else if (othersCategory == "5 Kandungan Bahan Lain") {
      variants = "e";
    } else if (othersCategory == "Lebih dari 5 Kandungan Bahan Lain") {
      variants = "f";
    } else {
      variants = "";
    }
    // emit(SettingsRankingWheyDone());
  }
}
