import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/add_list_whey_protein/bloc/post_list_whey_protein_bloc.dart';
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
                // return FormAddAlertDialog();
                return BlocProvider.value(
                  value: BlocProvider.of<PostListWheyProteinBloc>(context),
                  child: FormAddAlertDialog(),
                );
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

}