import 'package:flutter/material.dart';

class SpkSawUi extends StatefulWidget {
  const SpkSawUi({Key? key }) : super(key: key);

  @override
  State<SpkSawUi> createState() => _SpkSawUiDashboard(); 
}

class _SpkSawUiDashboard extends State<SpkSawUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 80,
            color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                _buildIconDashboardIventory(),
                
              ],
            ),
          ),
          Flexible(
            child: Column(
              children: [
                Text('data'),
                Text("test")
              ],
            ),
          )
        ],
       
      ),
    );
  }

  Widget _buildIconDashboardIventory () {
    return InkWell(
      onTap: () {
        //call event
        print("test on tap");
      },
      child: Column(
        children: [
          Icon(
            Icons.inventory_2_outlined,
            color: Colors.white,
            size: 35,
          ),
          SizedBox(height: 5),
          Text("List Whey" , style: 
            TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildIconDashboardCalculate () {
    return InkWell(
      onTap: () {
        //call event
        print("test on tap");
      },
      child: Column(
        children: [
          Icon(
            Icons.inventory_2_outlined,
            color: Colors.white,
            size: 35,
          ),
          SizedBox(height: 5),
          Text("List Whey" , style: 
            TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }

}