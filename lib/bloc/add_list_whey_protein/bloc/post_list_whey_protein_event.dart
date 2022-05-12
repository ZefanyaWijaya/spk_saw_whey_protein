part of 'post_list_whey_protein_bloc.dart';

abstract class PostListWheyProteinEvent extends Equatable {
  const PostListWheyProteinEvent();

  @override
  List<Object> get props => [];
}

class PostListNewWheyProtein extends PostListWheyProteinEvent {
  final AddDataListWheyProtein newListWheyData;

  PostListNewWheyProtein({
    required this.newListWheyData
  });

  @override
  List<Object> get props => [
        newListWheyData,
  ];

}


