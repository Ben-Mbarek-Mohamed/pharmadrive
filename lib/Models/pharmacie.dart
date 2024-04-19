class Pharmacie {
   String id;
   String name;
   String representant;
   String email;
   String phone;
   String address;

   // Constructor with all properties
   Pharmacie(this.id, this.name, this.representant, this.email, this.phone, this.address);

   // Constructor that initializes a Pharmacy object from a JSON map
   Pharmacie.fromJson(Map<String, dynamic> json)
       : id = json['id_pharmacie'],
          name = json['name'],
          representant = json['representant'],
          email = json['email'],
          phone = json['phone'],
          address = json['adresse']; // Ensure this key matches what's in your JSON

   // Method to convert the object to a JSON map
   Map<String, dynamic> toJson() => {
      'id_pharmacie': id,
      'name': name,
      'representant': representant,
      'email': email,
      'phone': phone,
      'adresse': address, // Ensure this key matches what's expected by the receivers of this JSON
   };
   @override
   String toString() {
      return 'Pharmacie{id: $id, name: $name, representant: $representant, email: $email, phone: $phone, address: $address}';
   }
}