

import 'package:flutter/cupertino.dart';

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
                flex: state.windowSize!.width <= 1024 ? 30 : 20,
                fit: FlexFit.tight,
                child: filterDropdown(),
              ),
              Flexible(
                flex: state.windowSize!.width <= 1024 ? 30 : 40,
                fit: FlexFit.tight,
                child: searchTextField(),
              ),
              Flexible(
                flex: 30,
                fit: FlexFit.tight,
                child: inputDateField(),
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

}