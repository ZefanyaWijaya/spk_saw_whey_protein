class DeleteDataListWheyProtein {
  final int idWheyProtein;

  DeleteDataListWheyProtein({
    required this.idWheyProtein
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _map ={
      "id_whey_protein" : this.idWheyProtein
    };
    return _map;
  }
}