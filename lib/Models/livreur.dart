class Livreur{
  String id_livreur;
  String name;
  String email;
  String phone;
  String car;
  String idSocietwLivreur;
  String adresse;
  String id_pharmacie;

  Livreur({
    this.id_livreur,
    this.name,
    this.email,
    this.phone,
    this.car,
    this.idSocietwLivreur,
    this.adresse,
    this.id_pharmacie
  });
  Map<String, dynamic> toJson() {
    return{
      'id_livreur' : id_livreur,
      'name' : name ,
      'email' : email ,
      'phone' : phone ,
      'car' : car ,
      'idSocietwLivreur' : idSocietwLivreur ,
      'adresse' : adresse ,
      'id_pharmacie' : id_pharmacie ,

    };
  }
  factory Livreur.fromJson(Map<String, dynamic> json){
    return Livreur(
        id_livreur: json['id_livreur'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        car: json['car'],
        idSocietwLivreur: json['idSocietwLivreur'],
        adresse: json['adresse'],
        id_pharmacie: json['id_pharmacie']
    );
  }
}