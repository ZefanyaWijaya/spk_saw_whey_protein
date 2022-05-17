import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/layout_manager_cubit/cubit/layout_manager_cubit.dart';
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
    return BlocBuilder<LayoutManagerCubit , LayoutManagerState>(
      builder: (context , state) {
        return Container(
          constraints: const BoxConstraints(
            minHeight: 100 , 
            maxHeight: 400
          ),
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
      
    );
  }

  Widget _buildRankingByList (){
    return Padding(
      padding: const EdgeInsets.only(right: 20),
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
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: BlocBuilder<LayoutManagerCubit,LayoutManagerState>(
        builder: (context , state) {
          if(state.windowSize!.width < 1500) {
            return Container(
              width: 300, 
              child: Text(
                dataRanking.wheyProteinName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ), softWrap: true, maxLines: 5,
              ),
            );
          } else if (state.windowSize!.width < 1200) {
            print("test1200");
            return Container(
              width: 10, 
              child: Text(
                dataRanking.wheyProteinName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ), softWrap: true, maxLines: 5,
              ),
            );
          }
          return Container(
            width: 400,
            child: Text(
              dataRanking.wheyProteinName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ), softWrap: true, maxLines: 5,
            ),
          );
        }
      ),
    );
  }

  Widget _buildScoreSaw (){
    return Padding(
      padding: const EdgeInsets.only(right: 20),
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