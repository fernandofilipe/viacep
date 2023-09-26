class CepListModel {
  List<CepModel>? results;

  CepListModel({this.results});

  CepListModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <CepModel>[];
      json['results'].forEach((v) {
        results!.add(CepModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CepModel {
  String? objectId;
  String? postalCode;
  String? address;
  String? complement;
  String? neighborhood;
  String? city;
  String? state;
  String? ibge;
  String? ddd;
  String? siafi;
  String? gia;
  String? createdAt;
  String? updatedAt;

  CepModel({
    this.objectId,
    this.postalCode,
    this.address,
    this.complement,
    this.neighborhood,
    this.city,
    this.state,
    this.ibge,
    this.ddd,
    this.siafi,
    this.gia,
    this.createdAt,
    this.updatedAt,
  });

  CepModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    postalCode = json['postal_code'];
    address = json['address'];
    complement = json['complement'];
    neighborhood = json['neighborhood'];
    city = json['city'];
    state = json['state'];
    ibge = json['ibge'];
    ddd = json['ddd'];
    siafi = json['siafi'];
    gia = json['gia'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['postal_code'] = postalCode;
    data['address'] = address;
    data['complement'] = complement;
    data['neighborhood'] = neighborhood;
    data['city'] = city;
    data['state'] = state;
    data['ibge'] = ibge;
    data['ddd'] = ddd;
    data['siafi'] = siafi;
    data['gia'] = gia;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }

  Map<String, dynamic> toJsonEndpoint() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['postal_code'] = postalCode;
    data['address'] = address;
    data['complement'] = complement;
    data['neighborhood'] = neighborhood;
    data['city'] = city;
    data['state'] = state;
    data['ibge'] = ibge;
    data['ddd'] = ddd;
    data['siafi'] = siafi;
    data['gia'] = gia;
    return data;
  }
}
