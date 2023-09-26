import 'package:viacep/models/cep_model.dart';

class ViaCepModel {
  String? postalCode;
  String? address;
  String? complement;
  String? neighborhood;
  String? city;
  String? state;
  String? ibge;
  String? gia;
  String? ddd;
  String? siafi;

  ViaCepModel(
      {String? postalCode,
      String? address,
      String? complement,
      String? neighborhood,
      String? city,
      String? state,
      String? ibge,
      String? gia,
      String? ddd,
      String? siafi}) {
    if (postalCode != null) {
      postalCode = postalCode;
    }
    if (address != null) {
      address = address;
    }
    if (complement != null) {
      complement = complement;
    }
    if (neighborhood != null) {
      neighborhood = neighborhood;
    }
    if (city != null) {
      city = city;
    }
    if (state != null) {
      state = state;
    }
    if (ibge != null) {
      ibge = ibge;
    }
    if (gia != null) {
      gia = gia;
    }
    if (ddd != null) {
      ddd = ddd;
    }
    if (siafi != null) {
      siafi = siafi;
    }
  }

  ViaCepModel.fromJson(Map<String, dynamic> json) {
    postalCode = json['cep'];
    address = json['logradouro'];
    complement = json['complemento'];
    neighborhood = json['bairro'];
    city = json['localidade'];
    state = json['uf'];
    ibge = json['ibge'];
    gia = json['gia'];
    ddd = json['ddd'];
    siafi = json['siafi'];
  }

  CepModel toCepModel() {
    return CepModel(
      postalCode: postalCode,
      address: address,
      complement: complement,
      neighborhood: neighborhood,
      city: city,
      state: state,
      ibge: ibge,
      gia: gia,
      ddd: ddd,
      siafi: siafi,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cep'] = postalCode;
    data['logradouro'] = address;
    data['complemento'] = complement;
    data['bairro'] = neighborhood;
    data['localidade'] = city;
    data['uf'] = state;
    data['ibge'] = ibge;
    data['gia'] = gia;
    data['ddd'] = ddd;
    data['siafi'] = siafi;
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
