import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viacep/models/general_response_model.dart';
import 'package:viacep/models/via_cep_model.dart';
import 'package:viacep/repository/cep/via_cep_repository.dart';
import 'package:viacep/shared/widgets/feedback_dialog.dart';

class ViaCepController extends GetxController {
  final TextEditingController searchController =
      TextEditingController(text: "");

  Future<CepResponse> search(String cep) async {
    final viaCepRespository = ViaCepRepository();
    ViaCepModel viaCepItem = await viaCepRespository.search(cep);
    CepResponse response = CepResponse(
        error: false,
        data: viaCepItem,
        message: "Sucesso",
        title: "Cep encontrado com sucesso.");

    if (response.error) {
      await Get.dialog(FeedBackDialog(response: response));
    }

    return response;
  }
}
