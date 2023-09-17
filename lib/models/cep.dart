class Cep {
  int? _id;
  late String cep;
  late String logradouro;
  late String complemento;
  late String bairro;
  late String localidade;
  late String uf;
  late int ibge;
  late int gia;
  late int ddd;
  late int siafi;

  late String _createdAt;
  late String updatedAt;

  Cep({
    int? id,
    this.cep = "",
    this.logradouro = "",
    this.complemento = "",
    this.bairro = "",
    this.localidade = "",
    this.uf = "",
    this.gia = 0,
    this.ddd = 0,
    this.siafi = 0,
    String createdAt = "",
    this.updatedAt = "",
  })  : _id = id,
        _createdAt = createdAt;

  int get id => _id ?? 0;

  Cep.fromJson(Map<String, dynamic> json) {
    _id = json["id"];
    cep = json["cep"];
    logradouro = json["logradouro"];
    complemento = json["complemento"];
    bairro = json["bairro"];
    localidade = json["localidade"];
    uf = json["uf"];
    gia = json["gia"];
    ddd = json["ddd"];
    siafi = json["siafi"];
    _createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = _id;
    data["cep"] = cep;
    data["logradouro"] = logradouro;
    data["complemento"] = complemento;
    data["bairro"] = bairro;
    data["localidade"] = localidade;
    data["uf"] = uf;
    data["gia"] = gia;
    data["ddd"] = ddd;
    data["siafi"] = siafi;
    data["created_at"] = _createdAt;
    data["updated_at"] = updatedAt;

    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
