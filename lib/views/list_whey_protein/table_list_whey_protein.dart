

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spk_saw_whey_protein/views/list_whey_protein/card_list_whey_protein.dart';

class TabelListWheyProtein extends StatefulWidget {
  const TabelListWheyProtein({Key? key, 
  // required this.constraints
  })
      : super(key: key);

  // final BoxConstraints constraints;

  @override
  TabelListWheyProteinState createState() => TabelListWheyProteinState();
}

class TabelListWheyProteinState extends State<TabelListWheyProtein> {

  ScrollController scrollController = ScrollController();
  ScrollController horizontalScrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return TabelListWheyProtein();
  }

  Widget TabelListWheyProtein() {
    return LayoutBuilder(builder: (context, constraints) {
      return ConstrainedBox(
        constraints: BoxConstraints(minWidth: constraints.maxWidth),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.stylus,
            PointerDeviceKind.touch,
          }),
          child: Scrollbar(
            controller: horizontalScrollController,
            showTrackOnHover: true,
            isAlwaysShown: true,
            child: SingleChildScrollView(
              controller: horizontalScrollController,
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 400,
                        child: const Text(
                          'Whey Protein Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 200,
                        child: const Text(
                          'Price / Serving',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: 250,
                        child: const Text(
                          'Protein (gr) / Serving',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: 300,
                        child: const Text(
                          'Calories / Serving',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 300,
                        child: const Text(
                          'Available Variants',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 300,
                        child: const Text(
                          'Details',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    thickness: 1,
                    color: Colors.black, //TILETEXTCOLOUR
                    
                  ),
                  Container(
                    height: 500,
                    child : Scrollbar(
                      controller: scrollController,
                      showTrackOnHover: true,
                      isAlwaysShown: true,
                      child: Container(
                        width: 1850,
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const CardListWheyProtein();
                            // return CardListSampleAdmin(
                            //   sampleData: state.listSample[index],
                            //   cellWidthData: {
                            //     '_cellWidthNamaSample': _cellWidthNamaSample,
                            //     '_cellWidthBatchPickup': _cellWidthBatchPickup,
                            //     '_cellWidthNamaPasien': _cellWidthNamaPasien,
                            //     '_cellWidthSTanggalLahir': _cellWidthSTanggalLahir,
                            //     '_cellWidthTanggalPickup': _cellWidthTanggalPickup,
                            //     '_cellWidthJJenisLayanan': _cellWidthJJenisLayanan,
                            //     '_cellWidthPartner': _cellWidthPartner,
                            //     '_cellWidthStatus': _cellWidthStatus,
                            //     '_colSpacing': _colSpacing
                            //   },
                            // );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

}