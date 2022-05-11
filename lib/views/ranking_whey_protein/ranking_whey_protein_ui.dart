import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/get_ranking_whey_protein/bloc/get_list_ranking_whey_bloc.dart';
import 'package:spk_saw_whey_protein/views/ranking_whey_protein/widgets/card_ranking_whey.dart';
import 'package:spk_saw_whey_protein/views/ranking_whey_protein/widgets/filter_ranking_whey.dart';


class RankingWheyProtein extends StatefulWidget {
  const RankingWheyProtein ({
    Key? key, 
    required this.constraints
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  RankingWheyProteinState createState() => RankingWheyProteinState();
}

class RankingWheyProteinState extends State<RankingWheyProtein> {

  @override
  void initState() {
    BlocProvider.of<GetListRankingWheyBloc>(context).add(GetListRankingWheyProtein());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height : 20),
        titleText(),
        const SizedBox(height: 70),
        listProductText(),
        const SizedBox(height: 50),
        IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 49,
                child: SizedBox(
                  height: 650,
                  child: BlocBuilder<GetListRankingWheyBloc,GetListRankingWheyState>(
                    builder: (context , state) {
                      if (state is GetListRankingWheyLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is GetListRankingWheyFailed) {
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
                      } else if (state is GetListRankingWheyDone) {
                        if(state.listDataRanking.isEmpty) {
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
                        } else {
                          return ListView.builder(
                            padding: const EdgeInsets.only(right: 20 , top: 40),
                            physics: const ClampingScrollPhysics(),
                            itemCount : state.listDataRanking.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: CardRankingWheyProtein(
                                  dataRanking: state.listDataRanking[index]
                                ),
                              );
                            },
                          );
                        }
                      }
                      return Container();
                    }
                  ),
                ),
              ),
              const Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: VerticalDivider(
                  color: Color.fromRGBO(83, 81, 81, 1),
                  indent: 20,
                  endIndent: 20,
                  thickness: 2,
                )
              ),
              const Flexible(
                fit: FlexFit.tight,
                flex: 49,
                child: FilterRankingWheyProtein(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget titleText() {
    return const Text(
      'Ranking Whey',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(2, 106, 199, 1),
      ),
    );
  }

  Widget listProductText() {
    return const Text(
      'List Product',
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(2, 106, 199, 1),
      ),
    );
  }

}