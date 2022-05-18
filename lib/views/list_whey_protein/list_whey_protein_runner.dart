import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/add_list_whey_protein/bloc/post_list_whey_protein_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/delete_list_whey_protein/bloc/delete_list_whey_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/get_list_whey_protein/bloc/list_whey_protein_get_by_search_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/get_list_whey_protein/settingsCubit/cubit/list_whey_protein_settings_cubit.dart';
import 'package:spk_saw_whey_protein/bloc/layout_manager_cubit/cubit/layout_manager_cubit.dart';
import 'package:spk_saw_whey_protein/bloc/update_list_whey_protein/bloc/update_list_whey_bloc.dart';
import 'package:spk_saw_whey_protein/custom_widget/failure_alert_dialog.dart';
import 'package:spk_saw_whey_protein/views/list_whey_protein/list_whey_protein_ui.dart';

class ListWheyProteinRunner extends StatelessWidget {
  ListWheyProteinRunner({Key? key}) : super(key: key);

  final LayoutManagerCubit settingsLayout = LayoutManagerCubit();
  final ListWheyProteinSettingsCubit settingsCubit = ListWheyProteinSettingsCubit();
  final UpdateListWheyBloc updateListWheyBloc = UpdateListWheyBloc();
  final DeleteListWheyBloc deleteListWheyBloc = DeleteListWheyBloc();
  final PostListWheyProteinBloc postBloc = PostListWheyProteinBloc();
  
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
              BlocProvider<DeleteListWheyBloc>(
                create: (context) => deleteListWheyBloc
              ),
              BlocProvider<UpdateListWheyBloc>(
                create: (context) => updateListWheyBloc
              ),
              BlocProvider<PostListWheyProteinBloc>(
                create: (BuildContext context) => postBloc
              ),
              BlocProvider<ListWheyProteinGetBySearchBloc>(
                create: (context) => ListWheyProteinGetBySearchBloc(
                  settingsCubit: settingsCubit,
                  delListBloc: deleteListWheyBloc,
                  postListBloc: postBloc,
                  putListBloc: updateListWheyBloc
                )
              ),
            ],
            child: MultiBlocListener(
              listeners: [
                BlocListener<ListWheyProteinGetBySearchBloc , ListWheyProteinGetBySearchState>(
                  listener: (context , state) {
                    if( state is ListWheyProteinGetBySearchFailed) {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return FailureAlertDialog(
                            errorMessage: state.errorMessage,
                            errorTitle: "Gagal Memuat Data",
                          );
                        },
                      );
                    }
                  }
                ),
                BlocListener<DeleteListWheyBloc , DeleteListWheyState>(
                  listener: (context , state) {
                    if( state is DeleteListWheyFailed) {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return FailureAlertDialog(
                            errorMessage: state.errorMessage,
                            errorTitle: "Gagal Menghapus Data",
                          );
                        },
                      );
                    }
                  }
                ),
                BlocListener<UpdateListWheyBloc , UpdateListWheyState>(
                  listener: (context , state) {
                    if( state is UpdateListWheyFailed) {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return FailureAlertDialog(
                            errorMessage: state.errorMessage,
                            errorTitle: "Gagal Mengubah Data",
                          );
                        },
                      );
                    }
                  }
                ),
                BlocListener<PostListWheyProteinBloc , PostListWheyProteinState>(
                  listener: (context , state) {
                    if( state is PostListWheyProteinFailedErrorInternalServer) {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return FailureAlertDialog(
                            errorMessage: "Internal Server Error (500). Mohon coba kembali di lain waktu",
                            errorTitle: "Gagal Menambahkan Data",
                          );
                        },
                      );
                    } else if (state is PostListWheyProteinFailedUnknownErrorCode) {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return FailureAlertDialog(
                            errorMessage: "Unknown Error Code. Segera hubungi pengembang webiste",
                            errorTitle: "Gagal Menambahkan Data",
                          );
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return FailureAlertDialog(
                            errorMessage: "Terjadi Kesalahan, segera hubungi pengembang website",
                            errorTitle: "Gagal Menambahkan Data",
                          );
                        },
                      );
                    }
                  }
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
          ),
        );
      }),
    );
  }
}