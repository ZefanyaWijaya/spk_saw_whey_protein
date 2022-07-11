import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/get_ranking_whey_protein/bloc/get_list_ranking_whey_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/get_ranking_whey_protein/cubit/cubit/settings_ranking_whey_cubit.dart';
import 'package:spk_saw_whey_protein/bloc/layout_manager_cubit/cubit/layout_manager_cubit.dart';

class FilterRankingWheyProtein extends StatefulWidget {
  const FilterRankingWheyProtein ({Key? key}) : super (key: key);

  @override
  FilterRankingWheyProteinState createState() => FilterRankingWheyProteinState();
}

class FilterRankingWheyProteinState extends State<FilterRankingWheyProtein> {
  
  String dropdownValueHarga = 'Harga : Semua Kategori';
  List<String> items = [
    'Harga : Semua Kategori', //send key nothing or ''     
    'Rp 0 - Rp 5.000',   //send key a
    "Rp 5.001 - Rp 10.000",   //send key b 
    "Rp 10.001 - Rp 15.000",  //send key c
    "Rp 15.001 - Rp 20.000",  //send key d
    "Rp 20.001 - Rp 25.000",  //send key e
    "Rp 25.001 - Rp 30.000",  //send key f
    "Lebih dari Rp 30.000"    //send key g
  ];

  String dropdownValueProtein = 'Protein : Semua Kategori';
  List<String> itemsProtein = [
    'Protein : Semua Kategori',  //send key nothing or '' 
    '0 gr - 5 gr',    //send key a
    '6 gr - 10 gr',   //send key b
    '11 gr - 15 gr',  //send key c
    '16 gr - 20 gr',  //send key d
    '21 gr - 25 gr',  //send key e
    '26 gr - 30 gr',  //send key f
    'Lebih dari 30 gr'//send key g
  ];

  String dropdownValueCalories = 'Calories : Semua Kategori';
  List<String> itemsCalories = [
    "Calories : Semua Kategori",  //send key nothing or '' 
    "0 calories - 100 calories",     //send key a
    "101 calories - 125 calories",  //send key b
    "126 calories - 150 calories",  //send key c
    "151 calories - 175 calories",  //send key d
    "176 calories - 200 calories",  //send key e
    "201 calories - 225 calories",  //send key f
    "226 calories - 250 calories",  //send key g
    "Lebih dari 250 calories",      //send key h
  ];

  String dropdownValueVariants = 'Variant Rasa : Semua Kategori';
  List<String> itemsVariants = [
    'Variant Rasa : Semua Kategori',  //send key nothing or '' 
    '1 Variant Rasa',     //send key a
    '2 Variant Rasa',     //send key b
    '3 Variant Rasa',     //send key c
    '4 Variant Rasa',     //send key d
    '5 Variant Rasa',     //send key e
    'Lebih dari 5 Variant Rasa',      //send key f
  ];

  String dropdownOtherIngredients = 'Kandungan Bahan Lain : Semua Kategori';
  List<String> itemsOthersIngredients = [
    'Kandungan Bahan Lain : Semua Kategori',  //send key nothing or '' 
    '1 Kandungan Bahan Lain',     //send key a
    '2 Kandungan Bahan Lain',     //send key b
    '3 Kandungan Bahan Lain',     //send key c
    '4 Kandungan Bahan Lain',     //send key d
    '5 Kandungan Bahan Lain',     //send key e
    'Lebih dari 5 Kandungan Bahan Lain',      //send key f
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutManagerCubit, LayoutManagerState>(
      builder: (context , state) {
        return Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              advancedSettingText(),
              const SizedBox(height: 50),
              
              //FILTER HARGA
              Container(
                height: 48,
                // width: 75,
                child: InputDecorator(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      value: dropdownValueHarga,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items.map((String harga) {
                        return DropdownMenuItem(
                          value: harga,
                          child: Text(
                            harga,
                            softWrap: true,
                            maxLines: 3,
                            style: const TextStyle(fontSize: 16),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        BlocProvider.of<SettingsRankingWheyCubit>(context).getKategoriRankingPriceFilter(newValue!);
                        setState(() {
                          dropdownValueHarga = newValue;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
        
              //FILTER PROTEIN
              Container(
                height: 48,
                // width: 75,
                child: InputDecorator(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      value: dropdownValueProtein,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: itemsProtein.map((String protein) {
                        return DropdownMenuItem(
                          value: protein,
                          child: Text(
                            protein,
                            softWrap: true,
                            maxLines: 3,
                            style: const TextStyle(fontSize: 16),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        BlocProvider.of<SettingsRankingWheyCubit>(context).getKategoriRankingProtein(newValue!);
                        setState(() {
                          dropdownValueProtein = newValue;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              
              //FILTER CALORIES
              Container(
                height: 48,
                // width: 75,
                child: InputDecorator(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      value: dropdownValueCalories,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: itemsCalories.map((String calories) {
                        return DropdownMenuItem(
                          value: calories,
                          child: Text(
                            calories,
                            maxLines: 3,
                            softWrap: true,
                            style: const TextStyle(fontSize: 16),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        BlocProvider.of<SettingsRankingWheyCubit>(context).getKategoriRankingCalories(newValue!);
                        setState(() {
                          dropdownValueCalories = newValue;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
        
              //FILTER VARIANT RASA
              Container(
                height: 48,
                // width: 75,
                child: InputDecorator(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      value: dropdownValueVariants, 
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: itemsVariants.map((String variants) {
                        return DropdownMenuItem(
                          value: variants,
                          child: Text(
                            variants,
                            maxLines: 3,
                            softWrap: true,
                            style: const TextStyle(fontSize: 16),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        BlocProvider.of<SettingsRankingWheyCubit>(context).getKategoriRankingVariants(newValue!);
                        setState(() {
                          dropdownValueVariants = newValue;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),

              //FILTER KANDUNGAN LAIN
              Container(
                height: 48,
                // width: 75,
                child: InputDecorator(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      value: dropdownOtherIngredients,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: itemsOthersIngredients.map((String others) {
                        return DropdownMenuItem(
                          value: others,
                          child: Text(
                            others,
                            softWrap: true,
                            maxLines: 3,
                            style: const TextStyle(fontSize: 16),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        BlocProvider.of<SettingsRankingWheyCubit>(context).getKategoriRankingOthersIngredients(newValue!);
                        setState(() {
                          dropdownOtherIngredients = newValue;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              setFilterButton()

            ],
          ),
        );
      }
    );
  }

  Widget advancedSettingText() {
    return const Text(
      'Advanced Settings',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        // color: Color.fromRGBO(2, 106, 199, 1),
        color: Colors.black
      ),
    );
  }

  Widget setFilterButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Container(
        width: 180,
        height: 45,
        child: ElevatedButton(
          onPressed: () {
            BlocProvider.of<GetListRankingWheyBloc>(context).add(GetListRankingWheyProtein());
          },
          child: const Text(
            'Set Filter',
            style: TextStyle(fontSize: 16),
          ),
          style: ElevatedButton.styleFrom(
              elevation: 0,
              // primary: const Color.fromRGBO(2, 106, 199, 1),
              primary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
        ),
      ),
    );
  }
}