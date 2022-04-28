import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/layout_manager_cubit/cubit/layout_manager_cubit.dart';
import 'package:spk_saw_whey_protein/views/list_whey_protein/list_whey_protein_ui.dart';

class ListWheyProteinRunner extends StatelessWidget {
  ListWheyProteinRunner({Key? key}) : super(key: key);

  final LayoutManagerCubit settingsLayout = LayoutManagerCubit();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView( 
          child: MultiBlocProvider(
            providers: [
              BlocProvider<LayoutManagerCubit>(
                create: (context) => settingsLayout,
              ),
            ],
            child: Padding(
              padding: const EdgeInsets.only(left: 48, top: 30),
              child: ListWheyProtein(constraints: constraints),
            ),
          ),
          
        );
      }),
    );
  }
}