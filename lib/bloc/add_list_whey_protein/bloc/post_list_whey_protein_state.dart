part of 'post_list_whey_protein_bloc.dart';

abstract class PostListWheyProteinState extends Equatable {
  const PostListWheyProteinState();
  
  @override
  List<Object> get props => [];
}

class PostListWheyProteinInitial extends PostListWheyProteinState {}

class PostListWheyProteinLoading extends PostListWheyProteinState {}

class PostListWheyProteinDone extends PostListWheyProteinState {}

class PostListWheyProteinFailed extends PostListWheyProteinState {}

class PostListWheyProteinFailedErrorInternalServer extends PostListWheyProteinFailed {}

class PostListWheyProteinFailedUnknownErrorCode extends PostListWheyProteinFailed {}



