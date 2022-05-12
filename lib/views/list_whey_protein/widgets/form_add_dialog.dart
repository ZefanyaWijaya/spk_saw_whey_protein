import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:spk_saw_whey_protein/bloc/add_list_whey_protein/bloc/post_list_whey_protein_bloc.dart';
import 'package:spk_saw_whey_protein/data_model/list_whey_protein_model/add_whey_protein_model.dart';

class formAddAlertDialog extends StatelessWidget {
  formAddAlertDialog({
    Key? key,
  }) : super (key: key);

  final GlobalKey<FormBuilderState> _formKey = GlobalKey();
  final PostListWheyProteinBloc postBloc = PostListWheyProteinBloc();
  

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostListWheyProteinBloc>(
          create: (BuildContext context) => postBloc
        ),
      ],
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        titlePadding:
        const EdgeInsets.symmetric(horizontal: 48).copyWith(top: 60),
        title: const SizedBox(
          width: 650,
          child: Text(
            "Add Whey Protein Product",
            textAlign: TextAlign.left,
            softWrap: true,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(2, 106, 199, 1),
            ),
          ),
        ),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 48).copyWith(top: 30),
        content: SizedBox(
          width: 650,
          child: SingleChildScrollView(
            child: FormBuilder(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  _wheyProteinName(context),
                  const SizedBox(height: 30),
                  _pricePerServing(context),
                  const SizedBox(height: 30),
                  _proteinPerServing(context),
                  const SizedBox(height: 30),
                  _caloriesPerServing(context),
                  const SizedBox(height: 30),
                  _availableVariants(context),
                  const SizedBox(height: 30),
                  _othersIngredients(context),
                  const SizedBox(height: 30),
                  _moreDetails(context),
                ]
               
              ),
            ),
          ),
        ),
        actionsPadding: const EdgeInsets.symmetric(horizontal: 48)
            .copyWith(top: 32, bottom: 40),
        actions: [
          SizedBox(
            height: 45,
            width: 313,
            child: Container(
              width: 180,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  print("test78");
                  if (_formKey.currentState!.saveAndValidate()) {
                    print("test80");
                    final Map<String, dynamic> data =
                        _formKey.currentState!.value;
                    print("test83");
                    final AddDataListWheyProtein newListWheyData = AddDataListWheyProtein(
                      wheyProteinName: data['wheyProtein'],
                      pricePerServing: data['pricePerServ'], 
                      proteinPerServing: data['proteinPerServ'], 
                      caloriesPerServing: data['caloriesPerServ'], 
                      availableVariants: data['availableVarProduct'], 
                      otherIngredients: data['otherIngredients'], 
                      moreDetails: data['moreDetails']
                    );
                    print("TEST ON UI");
                    print(newListWheyData);
                    BlocProvider.of<PostListWheyProteinBloc>(context).add(PostListNewWheyProtein(newListWheyData: newListWheyData));
                  }
                },
                child: const Text(
                  'Submit Whey Product',
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: const Color.fromRGBO(2, 106, 199, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
              ),
            ),
            // child: OutlinedButton(
            //   style: OutlinedButton.styleFrom(
            //     // minimumSize: Size(double.infinity, 45),
            //     primary: CustomColors.errorRed,
            //     side: BorderSide(color: CustomColors.errorRed),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(8),
            //     ),
            //   ),
            //   onPressed: () {
            //     Navigator.pop(context, false);
            //   },
            //   child: Text(
            //     'Batal',
            //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            //   ),
            // ),
          ),
        ]
      ),
    );
  }

  Widget _wheyProteinName(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 12.0),
          child: Text(
            "Whey Protein Name",
            style: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(83, 81, 81, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        FormBuilderTextField(
          name: "wheyProtein",
          decoration: const InputDecoration(
            constraints: BoxConstraints(
              maxWidth: 650,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 32),
            hintText: "Whey protein name",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(12),
            )),
          ),
          textInputAction: TextInputAction.next,
          valueTransformer: (String? wheyName) {
            if (wheyName != null) {
              return wheyName.trim();
            } else {
              return null;
            }
          },
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(context,
                errorText: 'Please enter whey protein name.'),
          ]),
        ),
      ],
    );
  }

  Widget _pricePerServing(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text(
            'Price / Serving',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(83, 81, 81, 1),
            ),
          ),
        ),
        FormBuilderTextField(
          name: 'pricePerServ',
          decoration: const InputDecoration(
            constraints: BoxConstraints(
              maxWidth: 650,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 32),
            hintText: 'Price / Serving',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(12),
            )),
          ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          textInputAction: TextInputAction.next,
          valueTransformer: (String? pricePerServing) {
            if (pricePerServing != null) {
              return int.tryParse(pricePerServing);
            } else {
              return null;
            }
          },
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(context,
                errorText: 'Please enter price / serving.')
          ]),
        ),
      ],
    );
  }

  Widget _proteinPerServing(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text(
            'Protein (gr) / Serving',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(83, 81, 81, 1),
            ),
          ),
        ),
        FormBuilderTextField(
          name: 'proteinPerServ',
          decoration: const InputDecoration(
            constraints: BoxConstraints(
              maxWidth: 650,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 32),
            hintText: 'Protein (gr) / Serving',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(12),
            )),
          ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          textInputAction: TextInputAction.next,
          valueTransformer: (String? proteinPerServ) {
            if (proteinPerServ != null) {
              return int.tryParse(proteinPerServ);
            } else {
              return null;
            }
          },
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(context,
                errorText: 'Please enter protein (gr) / serving.')
          ]),
        ),
      ],
    );
  }

  Widget _caloriesPerServing(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text(
            'Calories / Serving',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(83, 81, 81, 1),
            ),
          ),
        ),
        FormBuilderTextField(
          name: 'caloriesPerServ',
          decoration: const InputDecoration(
            constraints: BoxConstraints(
              maxWidth: 650,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 32),
            hintText: 'Calories / Serving',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(12),
            )),
          ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          textInputAction: TextInputAction.next,
          valueTransformer: (String? caloriesPerServ) {
            if (caloriesPerServ != null) {
              return int.tryParse(caloriesPerServ);
            } else {
              return null;
            }
          },
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(context,
                errorText: 'Please enter calories / serving.')
          ]),
        ),
      ],
    );
  }

  Widget _availableVariants(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text(
            'Available Variants',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(83, 81, 81, 1),
            ),
          ),
        ),
        FormBuilderTextField(
          name: 'availableVarProduct',
          decoration: const InputDecoration(
            constraints: BoxConstraints(
              maxWidth: 650,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 32),
            hintText: 'Available Variants',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(12),
            )),
          ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          textInputAction: TextInputAction.next,
          valueTransformer: (String? availableVarProduct) {
            if (availableVarProduct != null) {
              return int.tryParse(availableVarProduct);
            } else {
              return null;
            }
          },
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(context,
                errorText: 'Please enter amount of available variants.')
          ]),
        ),
      ],
    );
  }

  Widget _othersIngredients (BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text(
            'Others Ingredients',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(83, 81, 81, 1),
            ),
          ),
        ),
        FormBuilderTextField(
          name: 'otherIngredients',
          decoration: const InputDecoration(
            constraints: BoxConstraints(
              maxWidth: 650,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 32),
            hintText: 'Others Ingredients',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(12),
            )),
          ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          textInputAction: TextInputAction.next,
          valueTransformer: (String? otherIngredients) {
            if (otherIngredients != null) {
              return int.tryParse(otherIngredients);
            } else {
              return null;
            }
          },
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(context,
                errorText: 'Please enter amount of other ingredients.')
          ]),
        ),
      ],
    );
  }

  Widget _moreDetails(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 12.0),
          child: Text(
            "More Details (Source of Link)",
            style: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(83, 81, 81, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        FormBuilderTextField(
          name: "moreDetails",
          decoration: const InputDecoration(
            constraints: BoxConstraints(
              maxWidth: 650,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 32),
            hintText: "More Details (Source of Link)",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(12),
            )),
          ),
          textInputAction: TextInputAction.next,
          valueTransformer: (String? moreDetails) {
            if (moreDetails != null) {
              return moreDetails.trim();
            } else {
              return null;
            }
          },
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(context,
                errorText: 'Please enter more details (source of link).'),
          ]),
        ),
      ],
    );
  }

}