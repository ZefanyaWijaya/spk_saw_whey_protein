import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/get_calculate_whey_protein/bloc/get_calculate_whey_protein_by_search_bloc.dart';
import 'package:spk_saw_whey_protein/views/calculate_whey_protein/card_calculate_whey_protein.dart';

class TabelCalculateWheyProtein extends StatefulWidget {
  const TabelCalculateWheyProtein({Key? key,
  }) : super(key: key);

  @override
  TabelCalculateWheyProteinState createState() => TabelCalculateWheyProteinState();
}

class TabelCalculateWheyProteinState extends State<TabelCalculateWheyProtein>{

   @override
  void initState() {
    BlocProvider.of<GetCalculateWheyProteinBySearchBloc>(context).add(GetCalculateWheyProteinBySearch(keyword: null));
    super.initState();
  }

  ScrollController scrollController = ScrollController();
  ScrollController horizontalScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return tabelCalculateWheyProtein();
  }

  Widget tabelCalculateWheyProtein() {
    return LayoutBuilder(builder: (context, constraints) {
      return ConstrainedBox(
        constraints: BoxConstraints(minWidth: constraints.maxWidth),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.stylus,
            PointerDeviceKind.touch,
          }),
          child: Scrollbar(
            controller: horizontalScrollController,
            showTrackOnHover: true,
            isAlwaysShown: true,
            child: SingleChildScrollView(
              controller: horizontalScrollController,
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        width: 400,
                        child: const Text(
                          'Whey Protein Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 200,
                        child: const Text(
                          'Price (Cost)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: 250,
                        child: const Text(
                          'Protein (Benefit)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: 300,
                        child: const Text(
                          'Calories (Cost)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 300,
                        child: const Text(
                          'Available Variants (Benefit)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 300,
                        child: const Text(
                          'Other Ingredients (Benefit)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 200,
                        child: const Text(
                          'Score',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    thickness: 1,
                    color: Colors.black, //TILETEXTCOLOUR
                  ),
                  Container(
                    height: 600,
                    child : BlocBuilder<GetCalculateWheyProteinBySearchBloc,GetCalculateWheyProteinBySearchState>(
                      builder: (context, state) {
                        if(state is GetCalculateWheyProteinSearchDone) {
                          if(state.listCalculateWhey.isNotEmpty){
                            return Scrollbar(
                              controller: scrollController,
                              showTrackOnHover: true,
                              isAlwaysShown: true,
                              child: Container(
                                width: 2020,
                                child: ListView.builder(
                                  controller: scrollController,
                                  // itemCount: 10,
                                  itemCount: state.listCalculateWhey.length,
                                  itemBuilder: (context, index) {
                                    return  CardCalculateWheyProtein(
                                      dataCalculateWhey: state.listCalculateWhey[index] ,
                                    );
                                  },
                                ),
                              ),
                            );
                          } else {
                            return Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(
                                    Icons.description,
                                    color: Color.fromRGBO(83, 81, 81, 1),
                                  ),
                                  Text(
                                    'Data tidak ditemukan',
                                    style: TextStyle(
                                      color: Color.fromRGBO(83, 81, 81, 1),
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        } else if (state is GetCalculateWheyProteinSearchLoading) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (state is GetCalculateWheyProteinSearchFailed) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24.0),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 4.0),
                                    child: Icon(
                                      Icons.report_problem,
                                      color: Color.fromRGBO(83, 81, 81, 1),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Text(
                                      state.errorMessage,
                                      style: const TextStyle(
                                        color: Color.fromRGBO(83, 81, 81, 1),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } 
                        return Container();
                      }
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

}