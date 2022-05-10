import 'package:flutter/cupertino.dart';
import 'package:spk_saw_whey_protein/data_model/calculate_whey_protein_model/calculate_whey_protein_model.dart';

class CardCalculateWheyProtein extends StatefulWidget {
  const CardCalculateWheyProtein ({
    Key? key,
    required this.dataCalculateWhey
  }) : super (key: key);

  final GetCalculateWheyProteinList dataCalculateWhey;

  @override
  CardCalculateWheyProteinState createState() => CardCalculateWheyProteinState();
}

class CardCalculateWheyProteinState extends State<CardCalculateWheyProtein> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: dataCalculateWheyProtein(),
    );
  }

  Widget dataCalculateWheyProtein() {
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
            width: 20
          ),
          Container(
            width: 200,
            child: priceSawCost(),
          ),
          const SizedBox(
            width: 10
          ),
          Container(
            width: 250,
            child: proteinSawBenefit(),
          ),
          const SizedBox(
            width: 10
          ),
          Container(
            width: 300,
            child: caloriesSawCost(),
          ),
          const SizedBox(
            width: 10
          ),
          Container(
            width: 300,
            child: availableVariantsSawBenefit(),
          ),
          const SizedBox(
            width: 10
          ),
          Container(
            width: 300,
            child: otherIngredientsSawBenefit(),
          ),
          const SizedBox(
            width: 10
          ),
          Container(
            width: 200,
            child: scoreSaw(),
          ),
        ],
      ),
    );
  }


  Widget wheyProteinName() {
    return Text(
      // "Optimum Nutrition Gold 100% Whey Isolate Powder",
      widget.dataCalculateWhey.wheyProteinName,
      style: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(83, 81, 81, 1), 
      ),
    );
  }

  Widget priceSawCost() {
    return Text(
        // "Rp. 13.800",
        widget.dataCalculateWhey.pricePerServing.toString(),
        style: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(83, 81, 81, 1), 
        ),
    );
  }

  Widget proteinSawBenefit() {
    return Text(
      // "25 gr",
      widget.dataCalculateWhey.proteinPerServing.toString(),
      style: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(83, 81, 81, 1), 
      ),
    );
  }

  Widget caloriesSawCost() {
    return Text(
      // "120 Calories",
      widget.dataCalculateWhey.caloriesPerServing.toString(),
      style: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(83, 81, 81, 1),
      ),
    );
  }

  Widget availableVariantsSawBenefit() {
    return Text(
      // "3 Variants",
      widget.dataCalculateWhey.availableVariantProduct.toString(),
      style: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(83, 81, 81, 1),
      ),
    );
  }

  Widget otherIngredientsSawBenefit() {
    return Text(
      // "2",
      widget.dataCalculateWhey.otherIngredients.toString(),
      style: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(83, 81, 81, 1),
      ),
    );
  }

  Widget scoreSaw() {
    return Text(
      // "0.782612",
      widget.dataCalculateWhey.scoreSaw.toString(),
      style: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(83, 81, 81, 1),
      ),
    );
  }

}