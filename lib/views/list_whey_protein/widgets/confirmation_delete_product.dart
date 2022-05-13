import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FormDeleteProductAlertDialog extends StatelessWidget {
  FormDeleteProductAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      titlePadding:
      const EdgeInsets.symmetric(horizontal: 48).copyWith(top: 40),
      title: const SizedBox(
        width: 400,
        child: Text(
          "Delete Whey Product",
          textAlign: TextAlign.center,
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
      content: const SizedBox(
        width: 400,
        child: Text(
          'Are you sure want to delete this product ?',
          textAlign: TextAlign.center,
        ),
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 48).copyWith(top: 30, bottom: 25),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 180,
              height: 45,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(fontSize: 16),
                ),
                style: OutlinedButton.styleFrom(
                  // minimumSize: Size(double.infinity, 45),
                  primary: const Color.fromRGBO(2, 106, 199, 1),
                  side: const BorderSide(
                    color: Color.fromRGBO(2, 106, 199, 1),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Container(
              width: 180,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  //TODO DELETE PROVIDER
                },
                child: const Text(
                  'Delete',
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
          ],
        )
      ]
    );
  }
}