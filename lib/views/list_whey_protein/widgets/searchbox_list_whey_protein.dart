import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/layout_manager_cubit/cubit/layout_manager_cubit.dart';

class SearchboxListWheyProtein extends StatefulWidget {
  const SearchboxListWheyProtein({Key? key}) : super (key: key);


  @override
  SearchboxListWheyProteinState createState() => SearchboxListWheyProteinState(); 
}

class SearchboxListWheyProteinState extends State<SearchboxListWheyProtein> {

  TextEditingController textController = TextEditingController();
  bool showClearButton = false;
  bool clearDateTime = false;


  late List<String> searchTypeStringList;

 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutManagerCubit, LayoutManagerState>(
      builder: (context, state) {
        return Container(
          child: Row(
            children: [
              Flexible(
                flex: state.windowSize!.width <= 1024 ? 30 : 40,
                fit: FlexFit.tight,
                child: searchTextField(),
              ),
              Flexible(
                flex: 10,
                fit: FlexFit.tight,
                child: searchButton(),
              ),
              Flexible(child: Container()),
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
                    // BlocProvider.of<ListSampleAdminSettingsCubit>(context).searchByNameOrIdentityNumber(null);
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
          // BlocProvider.of<ListSampleAdminSettingsCubit>(context)
          //     .searchByNameOrIdentityNumber(
          //   textController.text.trim().isNotEmpty
          //       ? InputSearchSamplePartner(
          //           tipe: SearchSampleByType.values.firstWhere((element) => describeEnum(element) == selectedDropdownValue),
          //           keyword: textController.text.trim())
          //       : null
          // );
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
        primary: Theme.of(context).primaryColor,
        fixedSize: const Size(65, 45),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )
        ),
      ),
      onPressed: () {
        // BlocProvider.of<ListSampleAdminSettingsCubit>(context)
        //     .searchByNameOrIdentityNumber(
        //   textController.text.trim().isNotEmpty
        //       ? InputSearchSamplePartner(
        //           tipe: SearchSampleByType.values.firstWhere((element) => describeEnum(element) == selectedDropdownValue),
        //           keyword: textController.text.trim())
        //       : null
        // );
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