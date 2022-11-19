class Patient {
  late String fullName;
  late int discount;
  late String imageUrl;

  Patient(this.fullName, this.discount, this.imageUrl);

  factory Patient.fromJson (dynamic json) {
    return Patient(json['full_name'] as String, json['discount'] as int, json['imageUrl'] as String);
  }

  Map toJson () => {
    'full_name': fullName,
    'discount': discount,
    'description': imageUrl,
  };
}