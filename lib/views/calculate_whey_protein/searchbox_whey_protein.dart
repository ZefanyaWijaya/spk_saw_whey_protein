import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/get_calculate_whey_protein/bloc/get_calculate_whey_protein_by_search_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/layout_manager_cubit/cubit/layout_manager_cubit.dart';

class SearchboxCalculateWheyProtein extends StatefulWidget {
  const SearchboxCalculateWheyProtein ({Key? key}) : super (key: key);

  @override
  SearchboxCalculateWheyProteinState createState() => SearchboxCalculateWheyProteinState();
}

class SearchboxCalculateWheyProteinState extends State<SearchboxCalculateWheyProtein> { 

  TextEditingController textController = TextEditingController();
  bool showClearButton = false;
  bool clearDateTime = false; 

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutManagerCubit, LayoutManagerState>(
      builder: (context, state) {
        return Container(
          child: Row(
            children: [
              Flexible(
                flex: 40,
                fit: FlexFit.tight,
                child: searchTextField(),
              ),
              Flexible(
                flex: 10,
                fit: FlexFit.tight,
                child: searchButton(),
              ),
              Flexible(
                flex: 50,
                child: Container()
              ),
            ],
          ),
        );
      },
    );
  }

  Widget searchTextField() {
    return Container(
      height: 45,
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          hintText: "Search by whey name",
          suffixIcon: showClearButton == true
              ? IconButton(
                  splashRadius: 1,
                  icon: const Icon(Icons.cancel_rounded, size: 25),
                  onPressed: () {
                    textController.clear();
                    BlocProvider.of<GetCalculateWheyProteinBySearchBloc>(context).add(GetCalculateWheyProteinBySearch(keyword: null));
                    setState(() {
                      showClearButton = false;
                    });
                  },
              )
              : const SizedBox(),
          filled: true,
          fillColor: Colors.white,
        ),
        onSubmitted: (String value) {
          BlocProvider.of<GetCalculateWheyProteinBySearchBloc>(context).add(GetCalculateWheyProteinBySearch(keyword: textController.text.trim()));
          setState(() {
            textController.text.isNotEmpty
                ? showClearButton = true
                : showClearButton = false;
          });
        },
      ),
    );
  }

  Widget searchButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // primary: const Color.fromRGBO(2, 106, 199, 1),
        primary: Colors.black,
        fixedSize: const Size(65, 45),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )
        ),
      ),
      onPressed: () {
        BlocProvider.of<GetCalculateWheyProteinBySearchBloc>(context).add(GetCalculateWheyProteinBySearch(keyword: textController.text.trim()));
        setState(() {
          textController.text.isNotEmpty
              ? showClearButton = true
              : showClearButton = false;
        });
      },
      child: const Icon(Icons.search, color: Colors.white),
    );
  }
}
