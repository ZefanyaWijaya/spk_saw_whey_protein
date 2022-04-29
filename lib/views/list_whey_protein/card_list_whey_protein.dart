


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/get_list_whey_protein/bloc/list_whey_protein_get_by_search_bloc.dart';
import 'package:spk_saw_whey_protein/data_model/list_whey_protein_model/list_whey_protein_model.dart';

class CardListWheyProtein extends StatefulWidget {
  const CardListWheyProtein({
    Key? key,
    required this.dataWhey
  }) : super(key: key);

  final GetListWheyProteinData dataWhey;

  @override
  CardListWheyProteinState createState() => CardListWheyProteinState();
}

class CardListWheyProteinState extends State<CardListWheyProtein> {

  @override
  void initState() {
    BlocProvider.of<ListWheyProteinGetBySearchBloc>(context).add(ListWheyProteinGetBySearchAndFilter());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: dataListWheyProtein(),
    );
  }

  Widget dataListWheyProtein() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 400,
            child: wheyProteinName(),
          ),
          const SizedBox(
            width: 10
          ),
          Container(
            width: 200,
            child: pricePerServing(),
          ),
          const SizedBox(
            width: 10
          ),
          Container(
            width: 250,
            child: proteinPerServing(),
          ),
          const SizedBox(
            width: 10
          ),
          Container(
            width: 300,
            child: caloriesPerServing(),
          ),
          const SizedBox(
            width: 10
          ),
          Container(
            width: 300,
            child: availableVariants(),
          ),
          const SizedBox(
            width: 10
          ),
          Container(
            width: 300,
            child: details(),
          ),
        ],
      ),
    );
  }

  Widget wheyProteinName() {
    return Padding(
      padding: EdgeInsets.only(left: 25),
      child: Text(
        // "Optimum Nutrition Gold 100% Whey Isolate Powder",
        widget.dataWhey.wheyProteinName,
        style: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(83, 81, 81, 1), 
        ),
      ),
    );
  }

  Widget pricePerServing() {
    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: Text(
        // "Rp. 13.800",
        widget.dataWhey.pricePerServing.toString(),
        style: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(83, 81, 81, 1), 
        ),
      ),
    );
  }

  Widget proteinPerServing() {
    return Padding(
      padding: EdgeInsets.only(left: 5),
      child: Text(
        // "25 gr",
        widget.dataWhey.proteinPerServing.toString(),
        style: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(83, 81, 81, 1), 
        ),
      ),
    );
  }

  Widget caloriesPerServing() {
    return Text(
      // "120 Calories",
      widget.dataWhey.caloriesPerServing.toString(),
      style: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(83, 81, 81, 1),
      ),
    );
  }

  Widget availableVariants() {
    return  Text(
      // "3 Variants",
      widget.dataWhey.availableVariantProduct.toString(),
      style: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(83, 81, 81, 1),
      ),
    );
  }

  Widget details() {
    return Text(
      // "test",
      widget.dataWhey.moreDetail,
      style: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(83, 81, 81, 1),
      ),
    );
  }
  

}