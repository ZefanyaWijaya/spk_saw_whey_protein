import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/get_calculate_whey_protein/bloc/get_calculate_whey_protein_by_search_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/update_calculate_whey_protein/bloc/put_calculate_whey_bloc.dart';
import 'package:spk_saw_whey_protein/views/calculate_whey_protein/searchbox_whey_protein.dart';
import 'package:spk_saw_whey_protein/views/calculate_whey_protein/table_calculate_whey_protein.dart';
import 'package:spk_saw_whey_protein/views/calculate_whey_protein/widgets/calculate_info_dialog.dart';

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
    return BlocBuilder<GetCalculateWheyProteinBySearchBloc , GetCalculateWheyProteinBySearchState>(
      builder: (context , state) {
        if(state is GetCalculateWheyProteinSearchDone) {
          if(state.listCalculateWhey.isNotEmpty){
            return BlocBuilder<PutCalculateWheyBloc,PutCalculateWheyState>(
              builder: (context, handleState) {
                if (handleState is PutCalculateWheyLoading) {
                  return Tooltip(
                    padding: const EdgeInsets.all(20),
                    preferBelow: true,
                    verticalOffset: 20,
                    message: 'Tolong klik calculate terlebih dahulu,' 
                            'apabila ada data whey baru terinput maka' 
                            'score yang ditampilkan dapat berbeda',
                    textStyle: const TextStyle(
                      fontSize: 14 , 
                      color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Container(
                        width: 180,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            //DO NOTHING
                          },
                          child: const Text(
                            'Calculate Whey',
                            style: TextStyle(fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            // primary: const Color.fromRGBO(2, 106, 199, 1),
                            primary: const Color.fromRGBO(83, 81, 81, 1), 
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Tooltip(
                    padding: const EdgeInsets.all(20),
                    preferBelow: true,
                    verticalOffset: 20,
                    message: 'Tolong klik calculate terlebih dahulu,' 
                            'apabila ada data whey baru terinput maka' 
                            'score yang ditampilkan dapat berbeda',
                    textStyle: const TextStyle(
                      fontSize: 14 , 
                      color: Colors.white
                    ),
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
                              // primary: const Color.fromRGBO(2, 106, 199, 1),
                              primary: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              )),
                        ),
                      ),
                    ),
                  );
                }
              }
            );
          } else {
            return Container();
          }
        }
        return Container();
      }
      
    );
  }

  Widget titleText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          'Calculate Whey Protein',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            // color: Color.fromRGBO(2, 106, 199, 1),
            color: Colors.black
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          customBorder: const CircleBorder(),
          splashColor: const Color.fromRGBO(2, 106, 199, 1),
          onTap: () {
            //IF ADMIN ALLOW FUNCTIONS
            showDialog(
              context: context,
              builder: (_) {
                return CalculateDialogInfo();
              }
            );
          },
          child: const Tooltip(
            message: "Calculate Method Info",
            child: Icon(
              Icons.info_outline,
              // color: Color.fromRGBO(2, 106, 199, 1),
              color: Colors.black,
              size: 40.0,
            ),
          ),
        ),
      ],
    );
  }
}