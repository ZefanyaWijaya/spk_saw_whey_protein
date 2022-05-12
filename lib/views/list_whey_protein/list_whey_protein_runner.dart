import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/add_list_whey_protein/bloc/post_list_whey_protein_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/get_list_whey_protein/bloc/list_whey_protein_get_by_search_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/get_list_whey_protein/settingsCubit/cubit/list_whey_protein_settings_cubit.dart';
import 'package:spk_saw_whey_protein/bloc/layout_manager_cubit/cubit/layout_manager_cubit.dart';
import 'package:spk_saw_whey_protein/views/list_whey_protein/list_whey_protein_ui.dart';

class ListWheyProteinRunner extends StatelessWidget {
  ListWheyProteinRunner({Key? key}) : super(key: key);

  final LayoutManagerCubit settingsLayout = LayoutManagerCubit();
  final ListWheyProteinSettingsCubit settingsCubit = ListWheyProteinSettingsCubit();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        settingsLayout.updateLayoutState(constraints);
        return SingleChildScrollView( 
          child: MultiBlocProvider(
            providers: [
              BlocProvider<LayoutManagerCubit>(
                create: (context) => settingsLayout,
              ),
              BlocProvider<ListWheyProteinSettingsCubit>(
                create: (context) => settingsCubit
              ),
              BlocProvider<ListWheyProteinGetBySearchBloc>(
                create: (context) => ListWheyProteinGetBySearchBloc(
                  settingsCubit: settingsCubit
                )
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
                    child: ListWheyProtein(constraints: constraints),
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