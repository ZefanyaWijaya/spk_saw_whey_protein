import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk_saw_whey_protein/bloc/manage_saw_page_bloc/manage_page_saw_bloc.dart';

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
            child: BlocBuilder<ManagePageSawBloc , ManagePageSawState>(
              builder: (context , iconState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    iconState is ManagePageSawDoneToListWheyPage ?  _buildIconDashboardIventoryOnPressed() : _buildIconDashboardIventory(),
                    const SizedBox(height: 50),
                    iconState is ManagePageSawDoneToCalculateWheyPage ? _buildIconDashboardCalculateOnPressed() : _buildIconDashboardCalculate(),
                    const SizedBox(height: 50),
                    iconState is ManagePageSawDoneToRankingWheyPage ? _buildIconDashboardRankingOnPressed() : _buildIconDashboardRanking()
                  ],
                );
              }
            ),
          ),
          Flexible(
            child: BlocBuilder<ManagePageSawBloc,ManagePageSawState>(
              builder: (context , state){
                if(state is ManagePageSawLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if(state is ManagePageSawDoneToListWheyPage) {
                  return const Text("test List Whey");
                } else if (state is ManagePageSawDoneToCalculateWheyPage) {
                  return const Text("test calculate Whey");
                }else if (state is ManagePageSawDoneToRankingWheyPage) {
                  return const Text("test ranking Whey");
                }
                return Container();
              }
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
        BlocProvider.of<ManagePageSawBloc>(context).add(GoToListWheyPage());
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

  Widget _buildIconDashboardIventoryOnPressed () {
    return InkWell(
      onTap: () {
        //call event
        BlocProvider.of<ManagePageSawBloc>(context).add(GoToListWheyPage());
      },
      child: Column(
        children: const [
          Icon(
            Icons.inventory_2,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(height: 5),
          Text("List Whey" , style: 
            TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold
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
        BlocProvider.of<ManagePageSawBloc>(context).add(GoToCalculateWheyPage());
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

  Widget _buildIconDashboardCalculateOnPressed () {
    return InkWell(
      onTap: () {
        //call event
        BlocProvider.of<ManagePageSawBloc>(context).add(GoToCalculateWheyPage());
      },
      child: Column(
        children: const [
          Icon(
            Icons.calculate,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(height: 5),
          Text("Calculate" , style: 
            TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold
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
        BlocProvider.of<ManagePageSawBloc>(context).add(GoToRankingWheyPage());
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

  Widget _buildIconDashboardRankingOnPressed () {
    return InkWell(
      onTap: () {
        //call event
        BlocProvider.of<ManagePageSawBloc>(context).add(GoToRankingWheyPage());
      },
      child: Column(
        children: const [
          Icon(
            Icons.emoji_events,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(height: 5),
          Text("Ranking" , style: 
            TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }

}