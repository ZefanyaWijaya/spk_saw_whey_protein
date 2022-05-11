import 'package:flutter/material.dart';

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
        ListProductText(),
        const SizedBox(height: 50),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 49,
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                )
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
              Flexible(
                fit: FlexFit.tight,
                flex: 49,
                child: Container(
                    width: 200,
                  height: 200,
                  color: Colors.red,
                )
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

  Widget ListProductText() {
    return const Text(
      'List Product',
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(2, 106, 199, 1),
      ),
    );
  }

}