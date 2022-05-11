import 'package:flutter/material.dart';

class CardRankingWheyProtein extends StatelessWidget {
  const CardRankingWheyProtein({
    Key? key,
  }) : super (key: key);


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
    return const Text(
      "1 ", style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold
      ),
    );
  }

  Widget _buildWheyProteinname (){
    return Container(
      width: 400,
      child: const Text(
        "Muscle Booster Optimum Nutrion Evowhey Siasdasfsa asfsafas asfdsafas asfsaf asfsafas safsafas", style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ), softWrap: true, maxLines: 3,
      ),
    );
  }

  Widget _buildScoreSaw (){
    return const Text(
      "0,7829172", style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold
      ),
    );
  }

}