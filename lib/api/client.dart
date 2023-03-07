class Client {
  final String police;
  final String prix;
  final String type;
  final String dateD;
  final String dateF;

  const Client({
    required this.police,
    required this.prix,
    required this.type,
    required this.dateD,
    required this.dateF,

  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
    police: json['police'],
    prix: json['prix'],
    type: json['type'],
    dateD: json['dateD'],
    dateF: json['dateF'],
  );

  Map<String, dynamic> toJson() => {
    'police': police,
    'prix': prix,
    'type': type,
    'dateD': dateD,
    'dateF': dateF,
  };
}
