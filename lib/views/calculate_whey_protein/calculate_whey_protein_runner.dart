import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/layout_manager_cubit/cubit/layout_manager_cubit.dart';
import 'package:spk_saw_whey_protein/views/calculate_whey_protein/calculate_whey_protein_ui.dart';

class CalculateWheyProteinRunner extends StatelessWidget {
  CalculateWheyProteinRunner({Key? key}) : super(key: key);

  final LayoutManagerCubit settingsLayout = LayoutManagerCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        settingsLayout.updateLayoutState(constraints);
        return SingleChildScrollView(
          child:  MultiBlocProvider(
            providers: [
              BlocProvider<LayoutManagerCubit>(
                create: (context) => settingsLayout,
              ),
            ], 
            child: BlocBuilder<LayoutManagerCubit, LayoutManagerState>(
              bloc: settingsLayout,
              builder: (context, state) {
                if (state.layoutType != LayoutType.Desktop) { 
                  return const Center(
                    heightFactor: 60,
                    child: Text(
                      'View not supported for current layout',
                      style: TextStyle(fontSize: 14),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(left: 48, top: 30),
                    child: CalculateWheyProtein(constraints: constraints),
                  );
                }
              },
            ),
          ),
        );
      }),
    );
  }

  
}