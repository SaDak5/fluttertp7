class Classe {
  int nbreEtud;
  String nomClass;
  int? codClass;
  int departmentNumber; // Added departmentNumber

  Classe(this.nbreEtud, this.nomClass, this.departmentNumber, [this.codClass]);

  // Factory method to create a Classe object from JSON
  factory Classe.fromJson(Map<String, dynamic> json) {
    return Classe(
      json['nbreEtud'],
      json['nomClass'],
      json['department_number'], // Updated to match Spring Boot entity's field
      json['codClass'],
    );
  }

  // Add a method to convert the Classe object to JSON
  Map<String, dynamic> toJson() {
    return {
      'nbreEtud': nbreEtud,
      'nomClass': nomClass,
      'department_number':
          departmentNumber, // Updated to match Spring Boot entity's field
      'codClass': codClass,
    };
  }

  @override
  String toString() {
    return nomClass;
  }
}
