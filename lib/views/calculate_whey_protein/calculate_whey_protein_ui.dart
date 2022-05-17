import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/update_calculate_whey_protein/bloc/put_calculate_whey_bloc.dart';
import 'package:spk_saw_whey_protein/views/calculate_whey_protein/searchbox_whey_protein.dart';
import 'package:spk_saw_whey_protein/views/calculate_whey_protein/table_calculate_whey_protein.dart';

class CalculateWheyProtein extends StatefulWidget {
  const CalculateWheyProtein({
    Key? key, required this.constraints
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  CalculateWheyProteinState createState() => CalculateWheyProteinState();
}

class CalculateWheyProteinState extends State<CalculateWheyProtein> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height : 20),
        titleText(),
        Padding(
          padding: EdgeInsets.only(top: 48),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                flex: 65,
                // child: Container(),
                child: SearchboxCalculateWheyProtein(),
              ),
              Flexible(
                flex: 35,
                child: calculateWheyProteinButton(),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 50),
          child: TabelCalculateWheyProtein(),
        ),
      ],
    );
  }

  Widget calculateWheyProteinButton() {
    return Tooltip(
      padding: EdgeInsets.all(20),
      preferBelow: true,
      verticalOffset: 20,
      message: 'Tolong klik calculate terlebih dahulu,' 
               'apabila ada data whey baru terinput maka' 
               'score yang ditampilkan bisa berbeda',
      textStyle: TextStyle(fontSize: 14 , color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Container(
          width: 180,
          height: 45,
          child: ElevatedButton(
            onPressed: () {
              BlocProvider.of<PutCalculateWheyBloc>(context).add(PutCalculateWheyTriggerCalculateScore());
            },
            child: const Text(
              'Calculate Whey',
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
      ),
    );
  }

  Widget titleText() {
    return const Text(
      'Calculate Whey Protein',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(2, 106, 199, 1),
      ),
    );
  }

}