
class Medicament{
  String id;
  String nomMedicament;
  String prix;
  String remise;
  String image;
  int quantite;
  String detail;
  String idPharmacie;
  String  nomCategorie;
  String idPromotion;
  int seuil;
  int AlerteForSeuil;
  String tracabilite;

  Medicament({
    this.id,
    this.nomMedicament,
    this.prix,
    this.remise,
    this.image,
    this.quantite,
    this.detail,
    this.idPharmacie,
    this.nomCategorie,
    this.idPromotion,
    this.seuil,
    this.AlerteForSeuil,
    this.tracabilite,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomMedicament': nomMedicament,
      'prix': prix,
      'remise': remise,
      'image': image,
      'quantite': quantite,
      'detail': detail,
      'idPharmacie': idPharmacie,
      'nomCategorie': nomCategorie,
      'idPromotion': idPromotion,
      'seuil': seuil,
      'AlerteForSeuil': AlerteForSeuil,
      'tracabilite': tracabilite,
    };
  }


  factory Medicament.fromJson(Map<String, dynamic> json) {
    return Medicament(
      id: json['id'],
      nomMedicament: json['nomMedicament'],
      prix: json['prix'],
      remise: json['remise'],
      image: json['image'],
      quantite: json['quantite'],
      detail: json['detail'],
      idPharmacie: json['idPharmacie'],
      nomCategorie: json['nomCategorie'],
      idPromotion: json['idPromotion'],
      seuil: json['seuil'],
      AlerteForSeuil: json['AlerteForSeuil'],
      tracabilite: json['tracabilite'],
    );
  }


}

