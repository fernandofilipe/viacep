import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:viacep/models/cep_model.dart';
import 'package:viacep/repository/cep/cep_repository.dart';

class EditCepController extends GetxController {
  late TextEditingController addressController;
  late TextEditingController complementController;
  late TextEditingController neighborhoodController;
  late TextEditingController cityController;
  late TextEditingController stateController;
  late TextEditingController ibgeController;
  late TextEditingController giaController;
  late TextEditingController dddController;
  late TextEditingController siafiController;
  late CepRepository cepRepository;

  EditCepController() {
    addressController = TextEditingController(text: "");
    complementController = TextEditingController(text: "");
    neighborhoodController = TextEditingController(text: "");
    cityController = TextEditingController(text: "");
    stateController = TextEditingController(text: "");
    ibgeController = TextEditingController(text: "");
    giaController = TextEditingController(text: "");
    dddController = TextEditingController(text: "");
    siafiController = TextEditingController(text: "");
  }

  void init(CepModel cep) {
    addressController.text = cep.address ?? "";
    complementController.text = cep.complement ?? "";
    neighborhoodController.text = cep.neighborhood ?? "";
    cityController.text = cep.city ?? "";
    stateController.text = cep.state ?? "";
    ibgeController.text = cep.ibge ?? "";
    giaController.text = cep.gia ?? "";
    dddController.text = cep.ddd ?? "";
    siafiController.text = cep.siafi ?? "";
    cepRepository = CepRepository();
  }

  void save(String objectId, String postalCode) async {
    CepModel cepModel = CepModel(
      objectId: objectId,
      postalCode: postalCode,
      address: addressController.text,
      complement: complementController.text,
      neighborhood: neighborhoodController.text,
      city: cityController.text,
      state: stateController.text,
      ibge: ibgeController.text,
      gia: giaController.text,
      ddd: dddController.text,
      siafi: siafiController.text,
    );

    await cepRepository.update(cepModel);
  }

  //CepResponse validade(CepModel cepModel) {}
}
