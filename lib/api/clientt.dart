class Clientt {
  final String ndoss;
  final String asr;
  final String tel;
  final String pass;


  const Clientt({
    required this.ndoss,
    required this.asr,
    required this.tel,
    required this.pass,


  });

  factory Clientt.fromJson(Map<String, dynamic> json) => Clientt(
    ndoss: json['ndoss'],
    asr: json['asr'],
    tel: json['tel'],
    pass: json['pass'],
  );

  Map<String, dynamic> toJson() => {
    'ndoss': ndoss,
    'asr': asr,
    'tel': tel,
    'pass': pass,

  };
}