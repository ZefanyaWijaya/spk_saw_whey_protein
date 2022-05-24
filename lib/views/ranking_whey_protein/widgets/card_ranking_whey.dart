import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/layout_manager_cubit/cubit/layout_manager_cubit.dart';
import 'package:spk_saw_whey_protein/data_model/ranking_whey_protein_model/ranking_whey_protein_model.dart';
import 'package:url_launcher/url_launcher.dart';

class CardRankingWheyProtein extends StatelessWidget {
  const CardRankingWheyProtein({
    Key? key,
    required this.dataRanking,
    required this.ranking 
  })  : super (key: key);

  final GetListRankingWheyProteinData dataRanking;
  final int ranking;
  

  void _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) 
      throw 'Could not launch to website';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutManagerCubit,LayoutManagerState>(
      builder: (context , state) {
        return InkWell(
          onTap: () {
            _launchUrl(dataRanking.moreDetail);
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(
                color: Color.fromRGBO(2, 106, 199, 1),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Flexible(
                  child: Container(),
                  flex: 5,
                  fit: FlexFit.tight,
                ),
                Flexible(
                  flex: 10,
                  child: _buildRankingByList()
                ),
                Flexible(
                  child: Container(),
                  flex: 5,
                  fit: FlexFit.tight,
                ), 
                Flexible(
                  flex: 55,
                  fit: FlexFit.tight,
                  child: _buildWheyProteinname()
                ),
                Flexible(
                  child: Container(),
                  flex: state.windowSize!.width < 1400 ? 10 : 15,
                  fit: FlexFit.tight,
                ),
                Flexible(
                  flex: state.windowSize!.width < 1400 ? 15 : 10,
                  fit: FlexFit.tight,
                  child: _buildScoreSaw()
                )
              ],
            ),
          ),
        );
      }
      
    );
  }

  Widget _buildRankingByList (){
    return Padding(
      padding: EdgeInsets.only(top: 30 , bottom:  30),
      child: Text(
        (ranking + 1).toString(), 
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget _buildWheyProteinname (){
   return  Padding(
     padding: EdgeInsets.only(top: 30 , bottom:  30),
     child: Container(
          child: Text(
            dataRanking.wheyProteinName,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold
            ), softWrap: true, maxLines: 10,
          ),
        ),
   );
  }

  Widget _buildScoreSaw (){
    return Padding(
      padding: EdgeInsets.only(top: 30 , bottom:  30),
     
      child: Text(
          // "0,7829172", 
          dataRanking.scoreSaw.toString(),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
    );
  }
}