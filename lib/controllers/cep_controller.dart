import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viacep/models/cep.dart';
import 'package:viacep/models/response.dart';
import 'package:viacep/shared/widgets/feedback_dialog.dart';

class CepController extends GetxController {
  var cepList = <Cep>[].obs;
  late TextEditingController searchController;
  late DateTime selectedEditingDate;

  void init() {
    searchController = TextEditingController(text: "");
    selectedEditingDate = DateTime.now();

    getCeps();
  }

  Future<CepResponse> add({Cep? cep}) async {
    if (cep == null) {
      return CepResponse(error: true, message: "Usuário não pode ser vazio.");
    }

    //CepResponse response = await DBHelper.insert(cep);
    CepResponse response = CepResponse(
        error: false, message: "Sucesso", title: "Cep inserido com sucesso.");
    Cep newCep = response.data.first;
    cepList.assignAll([newCep, ...cepList]);

    return response;
  }

  Future<CepResponse> getCeps() async {
    //CepResponse response = await DBHelper.query();
    CepResponse response = CepResponse(
        error: false,
        data: [],
        message: "Sucesso",
        title: "Cep inserido com sucesso.");
    List<Map<String, dynamic>> ceps = response.error ? [] : response.data;
    cepList.assignAll(ceps.map((data) => Cep.fromJson(data)).toList());

    if (response.error) {
      await Get.dialog(FeedBackDialog(response: response));
    }

    return response;
  }

  Future<CepResponse> delete(Cep cep) async {
    //CepResponse cepResponse = await DBHelper.delete(cep);
    CepResponse cepResponse = CepResponse(
        error: false,
        data: [Cep(id: 1)],
        message: "Sucesso",
        title: "Cep inserido com sucesso.");
    Cep oldCep = cepResponse.data.first;
    cepList.removeWhere((Cep localCep) => localCep.id == oldCep.id);

    await Get.dialog(FeedBackDialog(response: cepResponse));
    if (!cepResponse.error) Get.back();
    return cepResponse;
  }
}
