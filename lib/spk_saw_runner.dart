import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/bloc/manage_page_saw_bloc.dart';
import 'package:spk_saw_whey_protein/spk_saw_ui.dart';

class SpkSawRunner extends StatelessWidget {
  const SpkSawRunner({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {

    final _manageSawSpkPageBloc = ManagePageSawBloc();
    //provider
      //listener
      //child :
    //provider

    return MultiBlocProvider(
      providers: [
        BlocProvider<ManagePageSawBloc>(
          create: (BuildContext context) => _manageSawSpkPageBloc,
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<ManagePageSawBloc,ManagePageSawState>(
            listener: (context , state) {
              if (state is ManagePageSawFailed) {
                
              }
            }
          )
        ],
        child: SpkSawUi()
      )
    );
  }
}