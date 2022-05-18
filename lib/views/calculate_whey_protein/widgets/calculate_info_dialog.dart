import 'package:flutter/material.dart';

class CalculateDialogInfo extends StatelessWidget {
  CalculateDialogInfo({
    Key? key,
  }) : super (key:key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      titlePadding:
      const EdgeInsets.symmetric(horizontal: 48).copyWith(top: 60),
      title: const SizedBox(
        width: 650,
        child: Text(
          "Calculate Simple Additive Weighting Information",
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
          child : Column(
            children: [
              RichText(
                text: const TextSpan(
                  children: <TextSpan> [
                    TextSpan(text: "Proses perhitungan yang dilakukan menggunakan metode SAW, dimana terdapat 5 kriteria yang akan dihitung berdasarkan jenis kriterianya, yakni jenis" ,
                    style: TextStyle(fontSize: 16 )),
                    TextSpan(text: " Benefit " , style: TextStyle(fontSize : 16, fontWeight: FontWeight.bold)),
                    TextSpan(text: "atau" , style:  TextStyle(fontSize: 16)),
                    TextSpan(text: " Cost ", style: TextStyle(fontSize : 16, fontWeight: FontWeight.bold)),
                    TextSpan(text: "dan juga berdasarkan bobot dari setiap kriterianya." , style: TextStyle(fontSize: 16)),
                  ]
                )
              )
            ],
          )
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
                Navigator.pop(context);
              },
              child: const Text(
                'Close',
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
        ),
      ]
    );
  }

  
}