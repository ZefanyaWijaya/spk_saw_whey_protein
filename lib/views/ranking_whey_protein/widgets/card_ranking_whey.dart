import 'package:flutter/material.dart';

class CardRankingWheyProtein extends StatelessWidget {
  const CardRankingWheyProtein({
    Key? key,
  }) : super (key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
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
          padding: EdgeInsets.all(24),
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
    return const Text(
      "Muscle Booster Optimum Nutrion Evowhey", style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold
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