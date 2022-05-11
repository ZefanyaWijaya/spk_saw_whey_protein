import 'package:flutter/material.dart';
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
                  height: 500,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(right: 20 , top: 40),
                    physics: const ClampingScrollPhysics(),
                    itemCount : 10,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: CardRankingWheyProtein(),
                      );
                    },
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