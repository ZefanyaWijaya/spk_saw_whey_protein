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
        width: 550,
        child: Text(
          "Calculate Simple Additive Weighting Information",
          textAlign: TextAlign.left,
          softWrap: true,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            // color: Color.fromRGBO(2, 106, 199, 1),
            color: Colors.black
          ),
        ),
      ),
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 48).copyWith(top: 50),
      content: SizedBox(
        width: 550,
        child: SingleChildScrollView(
          child : Column(
            children: [
              RichText(
                text: const TextSpan(
                  children: <TextSpan> [
                    TextSpan(text: "Proses perhitungan yang dilakukan menggunakan metode SAW, dimana terdapat 5 kriteria yang akan dihitung berdasarkan jenis kriterianya, yakni jenis" ,
                    style: TextStyle(fontSize: 18 ,)),
                    TextSpan(text: " Benefit " , style: TextStyle(fontSize : 18, fontWeight: FontWeight.bold)),
                    TextSpan(text: "atau" , style:  TextStyle(fontSize: 18)),
                    TextSpan(text: " Cost ", style: TextStyle(fontSize : 18, fontWeight: FontWeight.bold)),
                    TextSpan(text: "dan juga berdasarkan bobot dari setiap kriterianya." , style: TextStyle(fontSize: 18)),
                  ]
                )
              ),
              const SizedBox(height: 50),
              RichText(
                text: const TextSpan(
                  children: <TextSpan> [
                    TextSpan(text: "Benefit " , style: TextStyle(fontSize : 18, fontWeight: FontWeight.bold)),
                    TextSpan(text: "dapat diartikan suatu value asli pada suatu produk yang jumlahnya semakin tinggi semakin baik seperti berat protein (gr) , jumlah rasa yang tersedia, dan kandungan lain dalam whey protein itu sendiri. Sementara" ,
                    style: TextStyle(fontSize: 18 )),
                    TextSpan(text: " Cost ", style: TextStyle(fontSize : 18, fontWeight: FontWeight.bold)),
                    TextSpan(text: "dapat diartikan suatu value asli pada suatu produk yang jumlah nya semakin tinggi maka akan semakin buruk, seperti jumlah harga dan kalori yang terdapat dalam produk - produk yang ada." , style:  TextStyle(fontSize: 18)),
                  ]
                )
              )
            ],
          )
        ),
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 48)
          .copyWith(top: 50, bottom: 40),
      actions: [
        Container(
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
              // primary: const Color.fromRGBO(2, 106, 199, 1),
              primary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
          ),
        ),
      ]
    );
  }
}