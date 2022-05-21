import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/manage_saw_page_bloc/manage_page_saw_bloc.dart';
import 'package:spk_saw_whey_protein/custom_widget/failure_alert_dialog.dart';
import 'package:spk_saw_whey_protein/spk_saw_ui.dart';

class SpkSawRunner extends StatelessWidget {
  const SpkSawRunner({
    Key? key,
    required this.isAdminLoginRunner
  }) : super (key: key);

  final bool isAdminLoginRunner; 

  @override
  Widget build(BuildContext context) {

    final _manageSawSpkPageBloc = ManagePageSawBloc();

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
                showDialog(
                  context: context,
                  builder: (_) {
                    return FailureAlertDialog(
                      errorMessage: "Navigation failed, please try again next time",
                      errorTitle: "Failed to load page",
                    );
                  },
                );
              }
            }
          )
        ],
        child: isAdminLoginRunner == true ?  const SpkSawUi(isAdminLoginSawUi: true)
        : const SpkSawUi(isAdminLoginSawUi: false)
      )
    );
  }
}