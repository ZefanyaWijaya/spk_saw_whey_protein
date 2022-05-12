import 'package:flutter/material.dart';
import 'package:spk_saw_whey_protein/views/list_whey_protein/table_list_whey_protein.dart';
import 'package:spk_saw_whey_protein/views/list_whey_protein/widgets/filter_list_whey_protein.dart';
import 'package:spk_saw_whey_protein/views/list_whey_protein/widgets/form_add_dialog.dart';
import 'package:spk_saw_whey_protein/views/list_whey_protein/widgets/searchbox_list_whey_protein.dart';
class ListWheyProtein extends StatefulWidget {
  const ListWheyProtein({
    Key? key, required this.constraints
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  ListWheyProteinState createState() => ListWheyProteinState();
}

class ListWheyProteinState extends State<ListWheyProtein> {

  int dropdownValue = 20;
  List<int> items = [
    20,
    50,
    100,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height : 20),
        titleText(),
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                flex: 65,
                // child: Container(),
                child: SearchboxListWheyProtein(),
              ),
              Flexible(
                flex: 35,
                child: inputSampleButton(),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 48),
          child: FilterListWheyProtein(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 50),
          child: TabelListWheyProtein(),
        ),
      ],
    );
  }

  Widget titleText() {
    return const Text(
      'List Whey Product',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(2, 106, 199, 1),
      ),
    );
  }

  //FOR ADMIN ONLY

  Widget inputSampleButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Container(
        width: 180,
        height: 45,
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context, 
              builder: (_) {
                return formAddAlertDialog();
              }
            );
           
          },
          child: const Text(
            'Add Whey',
            style: TextStyle(fontSize: 16),
          ),
          style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: const Color.fromRGBO(2, 106, 199, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
        ),
      ),
    );
  }

  Widget jumlahDataTampil() {
    return Row(
      children: [
        const Text(
          'Tampilkan ',
          style: TextStyle(fontSize: 19),
        ),
        Container(
          height: 48,
          width: 75,
          child: InputDecorator(
            decoration: InputDecoration(
                border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: dropdownValue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((int limit) {
                  return DropdownMenuItem(
                    value: limit,
                    child: Text(
                      limit.toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                }).toList(),
                onChanged: (int? newValue) {
                  //FOR SETTINGS CUBIT SOON

                  // BlocProvider.of<ListSampleAdminSettingsCubit>(context)
                  //     .changeShowDataPerPage(newValue!);
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
              ),
            ),
          ),
        ),
        const Text(
          ' Pengguna per halaman',
          style: TextStyle(fontSize: 19),
        ),
      ],
    );
  }

}