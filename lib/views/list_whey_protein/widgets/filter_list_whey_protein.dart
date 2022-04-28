
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

  String dropdownValueHarga = 'Test 1';
  List<String> items = [
    'Test 1',
    "Test 2",
    "Test 3"
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
              flex: 17,
              child: Container(),
            ),
          ],
        );
      }
    );
  }

}