class MedicamentModel {
  String id;
  String name;
  String image;
  String prix;
  String remise;
  String pharmacie;
  String categorie;
  String quantite;
  String detail;
  String promotion;
  String seuil;
  String alerteForSeuil;

  MedicamentModel({
     this.id,
     this.name,
     this.image,
     this.prix,
     this.remise,
     this.pharmacie,
     this.categorie,
     this.quantite,
     this.detail,
     this.promotion,
     this.seuil,
     this.alerteForSeuil,
  });

  MedicamentModel.fromJson(Map<String, dynamic> map) {
    id = map['id_medicament'] ?? '';
    name = map['nomMedicament'] ?? '';
    image = map['image'] ?? '';
    prix = map['prix'] ?? '';
    remise = map['remise'] ?? '';
    pharmacie = map['idPharmacie'] ?? '';
    categorie = map["idCategorie"] ?? '';
    quantite = map["quantite"].toString();
    detail = map["detail"] ?? '';
    promotion = map["idPromotion"] ?? '';
    seuil = map["seuil"] ?? '';
    alerteForSeuil = map["alerteForSeuil"] ?? '';
  }
}
