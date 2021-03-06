import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/get_list_whey_protein/bloc/list_whey_protein_get_by_search_bloc.dart';
import 'package:spk_saw_whey_protein/views/list_whey_protein/card_list_whey_protein.dart';

class TabelListWheyProtein extends StatefulWidget {
  const TabelListWheyProtein({Key? key, 
    required this.isAdminLoginTable
  })
      : super(key: key);

  final bool isAdminLoginTable;

  @override
  TabelListWheyProteinState createState() => TabelListWheyProteinState();
}

class TabelListWheyProteinState extends State<TabelListWheyProtein> {
  @override
  void initState() {
    BlocProvider.of<ListWheyProteinGetBySearchBloc>(context).add(ListWheyProteinGetBySearchAndFilter());
    super.initState();
  }

  ScrollController scrollController = ScrollController();
  ScrollController horizontalScrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return TabelListWheyProtein();
  }

  Widget TabelListWheyProtein() {
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
                  Row(
                    children: [
                      Container(
                        width: widget.isAdminLoginTable == true ? 400 : 420,
                        child: const Text(
                          'Whey Protein Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: widget.isAdminLoginTable == true ? 200 : 220,
                        child: const Text(
                          'Price / Serving',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: widget.isAdminLoginTable == true ? 250 : 270,
                        child: const Text(
                          'Protein (gr) / Serving',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: widget.isAdminLoginTable == true ? 200 : 220,
                        child: const Text(
                          'Calories / Serving',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Tooltip(
                        message: "Jumlah berbagai rasa yang tersedia pada produk whey",
                        padding: const EdgeInsets.all(10),
                        preferBelow: true,
                        verticalOffset: 20,
                        textStyle: const TextStyle(
                          fontSize: 14 , 
                          color: Colors.white
                        ),
                        child: Container(
                          width: widget.isAdminLoginTable == true ? 200 : 220,
                          child: const Text(
                            'Available Variants',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: widget.isAdminLoginTable == true ? 180 : 200,
                        child: const Text(
                          'Details',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 80),
                      widget.isAdminLoginTable == true ?  
                      Container(
                        width: 120,
                        child: const Text(
                          'Settings',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ) 
                      : 
                      Container(
                        width: 0,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    thickness: 1,
                    color: Colors.black, //TILETEXTCOLOUR
                  ),
                  Container(
                    height: 500,
                    child : BlocBuilder<ListWheyProteinGetBySearchBloc,ListWheyProteinGetBySearchState>(
                      builder: (context, state) {
                        if(state is ListWheyProteinGetBySearchDone) {
                          if(state.listWheyProtein.isNotEmpty){
                            return Scrollbar(
                              controller: scrollController,
                              showTrackOnHover: true,
                              isAlwaysShown: true,
                              child: Container(
                                width: 1680,
                                child: ListView.builder(
                                  controller: scrollController,
                                  // itemCount: 10,
                                  itemCount: state.listWheyProtein.length,
                                  itemBuilder: (context, index) {
                                    return  CardListWheyProtein(
                                      dataWhey: state.listWheyProtein[index], 
                                      url: state.listWheyProtein[index].moreDetail,
                                      isAdminLoginCardList: widget.isAdminLoginTable,
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
                        } else if (state is ListWheyProteinGetBySearchLoading) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (state is ListWheyProteinGetBySearchFailed) {
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