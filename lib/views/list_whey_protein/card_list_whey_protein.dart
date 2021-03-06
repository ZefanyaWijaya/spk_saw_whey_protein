import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:spk_saw_whey_protein/bloc/delete_list_whey_protein/bloc/delete_list_whey_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/update_list_whey_protein/bloc/update_list_whey_bloc.dart';
import 'package:spk_saw_whey_protein/data_model/list_whey_protein_model/list_whey_protein_model.dart';
import 'package:spk_saw_whey_protein/views/list_whey_protein/widgets/confirmation_delete_product.dart';
import 'package:spk_saw_whey_protein/views/list_whey_protein/widgets/form_edit_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class CardListWheyProtein extends StatefulWidget {

  final GetListWheyProteinData dataWhey;
  final String url;
  late final Uri _url;
  final bool isAdminLoginCardList;

  CardListWheyProtein({
    Key? key,
    required this.dataWhey,
    required this.url,
    required this.isAdminLoginCardList 
  }) : super (key: key); 

  @override
  CardListWheyProteinState createState() => CardListWheyProteinState();
}

class CardListWheyProteinState extends State<CardListWheyProtein> {

  @override
  void initState() {
    widget._url = Uri.parse(widget.url);
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
            width: widget.isAdminLoginCardList == true ? 400 : 420,
            child: wheyProteinName(),
          ),
          const SizedBox(
            width: 10
          ),
          Container(
            width: widget.isAdminLoginCardList == true ? 200 : 220,
            child: pricePerServing(),
          ),
          const SizedBox(
            width: 10
          ),
          Container(
            width: widget.isAdminLoginCardList == true ? 250 : 270,
            child: proteinPerServing(),
          ),
          const SizedBox(
            width: 10
          ),
          Container(
            width: widget.isAdminLoginCardList == true ? 200 : 220,
            child: caloriesPerServing(),
          ),
          const SizedBox(
            width: 10
          ),
          Container(
            width: widget.isAdminLoginCardList == true ? 200 : 220,
            child: availableVariants(),
          ),
          const SizedBox(
            width: 10
          ),
          Container(
            width: widget.isAdminLoginCardList == true ? 180 : 200,
            child: details(),
          ),
          const SizedBox(
            width: 80
          ),
          widget.isAdminLoginCardList == true ? Container(
            width: 120,
            child: settings(),
          ) :
          Container(
          ) 
        ],
      ),
    );
  }

  Widget wheyProteinName() {
    return Text(
        // "Optimum Nutrition Gold 100% Whey Isolate Powder",
        widget.dataWhey.wheyProteinName,
        style: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(83, 81, 81, 1), 
        ),
    );
  }

  Widget pricePerServing() {
    return Text(
      NumberFormat("Rp #,###", "id_ID").format(widget.dataWhey.pricePerServing),
      // widget.dataWhey.pricePerServing.toString(),
      style: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(83, 81, 81, 1), 
      ),
    );
  }

  Widget proteinPerServing() {
    return Text(
      // "25 gr",
      widget.dataWhey.proteinPerServing.toString(),
      style: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(83, 81, 81, 1), 
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

  void _launchUrl() async {
    if (!await launchUrl(widget._url)) 
      throw 'Could not launch to website';
  }

  Widget details() {
    return Container(
      width: 180,
      height: 45,
      child: OutlinedButton(
        onPressed: () {
          _launchUrl();
        },
        child: const Text(
          ' Link To Website',
          style: TextStyle(fontSize: 16),
        ),
        style: OutlinedButton.styleFrom(
          // minimumSize: Size(double.infinity, 45),
          primary: const Color.fromRGBO(2, 106, 199, 1),
          // primary:  const Color.fromRGBO(123, 123, 123, 1),
          side: const BorderSide(
            color: Color.fromRGBO(2, 106, 199, 1),
            // color: Color.fromRGBO(123, 123, 123, 1),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget settings() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          customBorder: const CircleBorder(),
          splashColor: const Color.fromARGB(255, 255, 174, 0),
          onTap: () {
            //IF ADMIN ALLOW FUNCTIONS
            showDialog(
              context: context, 
              builder: (_) {
                return BlocProvider.value(
                  value: BlocProvider.of<UpdateListWheyBloc>(context),
                  child: FormEditAlertDialog(dataWheyInitialValue: widget.dataWhey),
                );
                // return FormEditAlertDialog(
                //   dataWheyInitialValue : widget.dataWhey,
                // );
              }
            );
            //ELSE DO NOTHING
          },
          child: const Tooltip(
            padding: EdgeInsets.all(10),
            preferBelow: true,
            verticalOffset: 20,
            textStyle: TextStyle(
              fontSize: 14 , 
              color: Colors.white
            ),
            message: "Edit Product (Admin Only)",
            child: Icon(
              Icons.settings_outlined,
              // color: Color.fromRGBO(2, 106, 199, 1),
              color: Color.fromARGB(255, 255, 174, 0),
              size: 40.0,
              
            ),
          ),
        ),
        InkWell(
          customBorder: const CircleBorder(),
          splashColor: const Color.fromRGBO(2, 106, 199, 1),
          onTap: () {
            //IF ADMIN ALLOW FUNCTIONS
            showDialog(
              context: context,
              builder: (_) {
                return BlocProvider.value(
                  value: BlocProvider.of<DeleteListWheyBloc>(context),
                  child: FormDeleteProductAlertDialog(dataWhey: widget.dataWhey),
                );
              }
            );
          },
          child: const Tooltip(
            message: "Delete Product (Admin Only)",
            padding: EdgeInsets.all(10),
            preferBelow: true,
            verticalOffset: 20,
            textStyle: TextStyle(
              fontSize: 14 , 
              color: Colors.white
            ),
            child: Icon(
              Icons.delete_outline,
              // color: Color.fromRGBO(2, 106, 199, 1),
              color: Color.fromRGBO(255, 0, 0, 1),
              size: 40.0,
              
            ),
          ),
        ),
      ],
    );
  }
}