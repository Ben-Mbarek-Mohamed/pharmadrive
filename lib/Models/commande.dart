import 'etat.dart';
import 'medicament.dart';

class Commande{
  String id;
  String idPharamcie;
  String idClient;
  String etat;
  List<Medicament> medicaments;
  double ammount;
  String date;
  String nomMedecin;


  Commande({
    this.id,
    this.idPharamcie,
    this.idClient,
    this.etat,
    this.medicaments,
    this.ammount,
    this.date,
    this.nomMedecin
  });


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idPharamcie': idPharamcie,
      'idClient': idClient,
      'etat': etat,
      'medicaments': medicaments.map((medicament) => medicament.toJson()).toList(),
      'ammount': ammount,
      'date' : date,
      'nomMedecin': nomMedecin
    };
  }


  factory Commande.fromJson(Map<String, dynamic> json) {
    return Commande(
      id: json['id'],
      idPharamcie: json['idPharamcie'],
      idClient: json['idClient'],
      etat: json['etat'],
      medicaments: (json['medicaments'] as List<dynamic>)
          .map((medicamentJson) => Medicament.fromJson(medicamentJson))
          .toList(),
      ammount: json['ammount'],
      date: json['date'],
      nomMedecin: json['nomMedecin']
    );
  }

}