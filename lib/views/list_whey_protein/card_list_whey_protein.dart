


import 'package:flutter/material.dart';

class CardListWheyProtein extends StatefulWidget {
  const CardListWheyProtein(
      {Key? key})
      : super(key: key);

  @override
  CardListWheyProteinState createState() => CardListWheyProteinState();
}

class CardListWheyProteinState extends State<CardListWheyProtein> {
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
            width: 300,
            child: wheyProteinName(),
          ),
          const SizedBox(
            width: 10
          ),
          Container(
            width: 300,
            child: pricePerServing(),
          ),
          const SizedBox(
            width: 10
          ),
          Container(
            width: 300,
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
    return const Text(
      "Optimum Nutrition Gold 100% Whey Isolate Powder",
      style: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(83, 81, 81, 1), 
      ),
    );
  }

  Widget pricePerServing() {
    return const Text(
      "Rp. 13.800",
      style: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(83, 81, 81, 1), 
      ),
    );
  }

  Widget proteinPerServing() {
    return const Text(
      "25 gr",
      style: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(83, 81, 81, 1), 
      ),
    );
  }

  Widget caloriesPerServing() {
    return const Text(
      "120 Calories",
      style: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(83, 81, 81, 1),
      ),
    );
  }

  Widget availableVariants() {
    return const Text(
      "3 Variants",
      style: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(83, 81, 81, 1),
      ),
    );
  }

  Widget details() {
    return const Text(
      "test",
      style: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(83, 81, 81, 1),
      ),
    );
  }
  

}