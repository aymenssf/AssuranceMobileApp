class Clienttt {
  final String dateF;

  const Clienttt({

    required this.dateF,

  });

  factory Clienttt.fromJson(Map<String, dynamic> json) => Clienttt(

    dateF: json['dateF'],
  );

  Map<String, dynamic> toJson() => {

    'dateF': dateF,

  };
}