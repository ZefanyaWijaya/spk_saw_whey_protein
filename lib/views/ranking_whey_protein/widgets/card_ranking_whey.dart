import 'package:flutter/material.dart';
import 'package:spk_saw_whey_protein/data_model/ranking_whey_protein_model/ranking_whey_protein_model.dart';

class CardRankingWheyProtein extends StatelessWidget {
  const CardRankingWheyProtein({
    Key? key,
    required this.dataRanking,
    required this.ranking 
  })  : super (key: key);

  final GetListRankingWheyProteinData dataRanking;
  final int ranking;



  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 100 , maxHeight: 300),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(
            // color: CustomColors.tertiaryGrey,
            color: Color.fromRGBO(2, 106, 199, 1),
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildRankingByList(),
              _buildWheyProteinname(),
              _buildScoreSaw()
    
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRankingByList (){
    return Text(
      (ranking + 1).toString(), 
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold
      ),
    );
  }

  Widget _buildWheyProteinname (){
    return Container(
      width: 400,
      child: Text(
        dataRanking.wheyProteinName,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ), softWrap: true, maxLines: 3,
      ),
    );
  }

  Widget _buildScoreSaw (){
    return Text(
      // "0,7829172", 
      dataRanking.scoreSaw.toString(),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold
      ),
    );
  }
}