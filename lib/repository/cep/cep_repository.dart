import 'package:flutter/material.dart';
import 'package:viacep/models/cep_model.dart';
import 'package:viacep/repository/cep/back4app_custom_dio.dart';

class CepRepository {
  final _customDio = Back4AppCustomDio();

  CepRepository();

  Future<CepListModel> get(String? objectId) async {
    String url = '/PostalCode';
    url = objectId != null && objectId.trim() != ''
        ? '$url?where={"objectId":"$objectId"}'
        : url;

    final response = await _customDio.dio.get(url);

    if (response.statusCode == 200) {
      var ceps = response.data;
      return CepListModel.fromJson(ceps);
    }

    return CepListModel();
  }

  Future<bool> duplicated(String? postalCode) async {
    String url = '/PostalCode';
    url = postalCode != null && postalCode.trim() != ''
        ? '$url?where={"postal_code":"$postalCode"}'
        : url;

    final response = await _customDio.dio.get(url);

    if (response.statusCode == 200) {
      var ceps = response.data['results'];
      return ceps.length > 0;
    }

    return true;
  }

  Future<CepModel> create(CepModel cep) async {
    String url = '/PostalCode';

    try {
      final response =
          await _customDio.dio.post(url, data: cep.toJsonEndpoint());

      final objectId = response.data['objectId'];
      final newCep = await get(objectId);

      return newCep.results != null ? newCep.results!.first : CepModel();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<CepModel> update(CepModel cep) async {
    String url = '/PostalCode/${cep.objectId}';

    try {
      await _customDio.dio.put(url, data: cep.toJsonEndpoint());
      final updatedCep = await get(cep.objectId);

      return updatedCep.results != null
          ? updatedCep.results!.first
          : CepModel();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<void> delete(String objectId) async {
    String url = '/PostalCode/$objectId';

    try {
      await _customDio.dio.delete(url);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
