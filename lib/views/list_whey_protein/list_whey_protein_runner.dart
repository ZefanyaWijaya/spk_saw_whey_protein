import 'package:flutter/material.dart';
import 'package:spk_saw_whey_protein/views/list_whey_protein/list_whey_protein_ui.dart';

class ListWheyProteinRunner extends StatelessWidget {
  const ListWheyProteinRunner({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView( 
          child: Padding(
            padding: const EdgeInsets.only(left: 48, top: 30),
            child: ListWheyProtein(constraints: constraints),
          ),
          
        );
      }),
    );
  }
}