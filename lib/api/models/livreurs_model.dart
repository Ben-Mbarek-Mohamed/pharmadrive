class LivreursModel {
  String id;
  String name;
  String email;
  String phone;
  String car;
  String addresse;
  
  LivreursModel(this.id, this.name, this.email, this.phone, this.car,
      this.addresse);

  LivreursModel.fromJson(Map<String,dynamic> map) {
    this.id = map['id_livreur'];
    this.name = map['name'];
    this.email = map['email'];
    this.phone = map['phone'] ;
    this.car = map['car'];
    this.addresse = map['addresse'];
    
  }
}
