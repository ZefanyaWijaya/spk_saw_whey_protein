
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/layout_manager_cubit/cubit/layout_manager_cubit.dart';

class FilterListWheyProtein extends StatefulWidget {
  const FilterListWheyProtein({Key? key}) : super (key: key);

  @override
  FilterListWheyProteinState createState() => FilterListWheyProteinState();
  
}

class FilterListWheyProteinState extends State<FilterListWheyProtein> {

  String dropdownValueHarga = 'Harga : Semua Kategori';
  List<String> items = [
    'Harga : Semua Kategori', //send key nothing or ''     
    'Kurang dari Rp 5.000',   //send key a
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
    'Kurang dari 5 gr',    //send key a
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
    "Kurang dari 100 calories",     //send key a
    "101 calories - 125 calories",  //send key b
    "126 calories - 126 calories",  //send key c
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


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutManagerCubit, LayoutManagerState>(
      builder: (context , state) {
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Text(
                'Filter',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).shadowColor,
                ),
              ),
            ),
            //FILTER HARGA
            Flexible(
              flex: 20,
              child: Container(
                height: 48,
                // width: 75,
                child: InputDecorator(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
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
                        // BlocProvider.of<ListSampleAdminSettingsCubit>(context)
                        //     .changeShowDataPerPage(newValue!);
                        setState(() {
                          dropdownValueHarga = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
            //FILTER PROTEIN
            Flexible(
              flex: 20,
              child: Container(
                height: 48,
                // width: 75,
                child: InputDecorator(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
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
                        // BlocProvider.of<ListSampleAdminSettingsCubit>(context)
                        //     .changeShowDataPerPage(newValue!);
                        setState(() {
                          dropdownValueProtein = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
            //FILTER CALORIES
            Flexible(
              flex: 20,
              child: Container(
                height: 48,
                // width: 75,
                child: InputDecorator(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
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
                        // BlocProvider.of<ListSampleAdminSettingsCubit>(context)
                        //     .changeShowDataPerPage(newValue!);
                        setState(() {
                          dropdownValueCalories = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
            //FILTER VARIANT RASA
            Flexible(
              flex: 20,
              child: Container(
                height: 48,
                // width: 75,
                child: InputDecorator(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
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
                        // BlocProvider.of<ListSampleAdminSettingsCubit>(context)
                        //     .changeShowDataPerPage(newValue!);
                        setState(() {
                          dropdownValueVariants = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 17,
              child: Container(),
            ),
          ],
        );
      }
    );
  }

}