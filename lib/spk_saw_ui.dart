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
            color: const Color.fromRGBO(0, 64, 150, 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                _buildIconDashboardIventory(),
                const SizedBox(height: 50),
                _buildIconDashboardCalculate(),
                const SizedBox(height: 50),
                _buildIconDashboardRanking()
              ],
            ),
          ),
          Flexible(
            child: Container(
              
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
        children: const [
          Icon(
            Icons.inventory_2_outlined,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(height: 5),
          Text("List Whey" , style: 
            TextStyle(
              color: Colors.white,
              fontSize: 14,
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
        children: const [
          Icon(
            Icons.calculate_outlined,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(height: 5),
          Text("Calculate" , style: 
            TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildIconDashboardRanking () {
    return InkWell(
      onTap: () {
        //call event
        print("test on tap");
      },
      child: Column(
        children: const [
          Icon(
            Icons.emoji_events_outlined,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(height: 5),
          Text("Ranking" , style: 
            TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }

}