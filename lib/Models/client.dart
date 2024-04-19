class Client{
  String id;
  String matricule;
  String nom_complet;
  Client({
    this.id,
    this.matricule,
    this.nom_complet
  });
  Map<String, dynamic> toJson() {
    return{
      'id' : id,
      'matricule' : matricule ,
      'nom_complet' : nom_complet
    };
  }
  factory Client.fromJson(Map<String, dynamic> json){
    return Client(
      id: json['id'],
      matricule: json['matricule'],
      nom_complet: json['nom_complet']
    );
  }
}