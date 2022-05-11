import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/get_ranking_whey_protein/bloc/get_list_ranking_whey_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/get_ranking_whey_protein/cubit/cubit/settings_ranking_whey_cubit.dart';
import 'package:spk_saw_whey_protein/bloc/layout_manager_cubit/cubit/layout_manager_cubit.dart';
import 'package:spk_saw_whey_protein/views/ranking_whey_protein/ranking_whey_protein_ui.dart';

class RankingWheyProteinRunner extends StatelessWidget {
  RankingWheyProteinRunner({Key? key}) : super(key: key);

  final LayoutManagerCubit settingsLayout = LayoutManagerCubit();
  final SettingsRankingWheyCubit settingsCubitRunner = SettingsRankingWheyCubit();
  

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
              BlocProvider<SettingsRankingWheyCubit>(
                create: (context) => settingsCubitRunner,
              ),
              BlocProvider<GetListRankingWheyBloc>(
                create: (context) => GetListRankingWheyBloc(
                  settingsCubit: settingsCubitRunner
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
                    child: RankingWheyProtein(constraints: constraints),
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