class UF {

  int id;
  String name;
  String initials;

  UF({this.id, this.name,this.initials});

  factory UF.fromJson(Map<String, dynamic> json) => UF(
    id: json['id'],
    initials: json['sigla'],
    name: json['nome'],
  );

  @override
  String toString() {
    return 'UF{id: $id, name: $name, initials: $initials}';
  }
}