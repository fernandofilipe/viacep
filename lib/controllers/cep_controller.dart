import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viacep/models/cep_model.dart';
import 'package:viacep/models/general_response_model.dart';
import 'package:viacep/models/via_cep_model.dart';
import 'package:viacep/repository/cep/cep_repository.dart';
import 'package:viacep/shared/widgets/feedback_dialog.dart';

class CepController extends GetxController {
  var cepList = <CepModel>[].obs;
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

  void init(CepModel cep) {
    addressController = TextEditingController(text: "");
    complementController = TextEditingController(text: "");
    neighborhoodController = TextEditingController(text: "");
    cityController = TextEditingController(text: "");
    stateController = TextEditingController(text: "");
    ibgeController = TextEditingController(text: "");
    giaController = TextEditingController(text: "");
    dddController = TextEditingController(text: "");
    siafiController = TextEditingController(text: "");

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

  void disposeControllers() {
    addressController.dispose();
    complementController.dispose();
    neighborhoodController.dispose();
    cityController.dispose();
    stateController.dispose();
    ibgeController.dispose();
    giaController.dispose();
    dddController.dispose();
    siafiController.dispose();
  }

  Future<CepResponse> get() async {
    final cepRespository = CepRepository();
    CepListModel cepItems = await cepRespository.get(null);
    CepResponse response = CepResponse(
      error: false,
      data: [],
      message: "Ceps obtidos com sucesso.",
      title: "Sucesso!",
    );

    cepList.assignAll(cepItems.results!.map((data) => data).toList().reversed);

    if (response.error) {
      await Get.dialog(FeedBackDialog(response: response));
    }

    return response;
  }

  Future<CepResponse> add({required CepModel cep}) async {
    final cepRespository = CepRepository();
    CepResponse response;
    bool isDuplicated = await cepRespository.duplicated(cep.postalCode);
    if (!isDuplicated) {
      CepModel createdCep = await cepRespository.create(cep);
      cepList.assignAll([createdCep, ...cepList]);

      response = CepResponse(
        error: false,
        message: "Cep inserido com sucesso.",
        title: "Sucesso!",
      );
    } else {
      response = CepResponse(
        error: true,
        message: "O Cep já existe na base de dados.",
        title: "Cancelado!",
      );

      await Get.dialog(FeedBackDialog(response: response));
    }

    return response;
  }

  Future<CepResponse> search(String cep) async {
    final cepRespository = CepRepository();
    CepListModel cepItems = await cepRespository.get(cep);
    CepResponse response = CepResponse(
      error: false,
      data: cepItems,
      message: "Cep encontrado com sucesso.",
      title: "Sucesso!",
    );
    cepList.assignAll(cepItems.results!.map((data) => data).toList());

    if (response.error) {
      await Get.dialog(FeedBackDialog(response: response));
    }

    return response;
  }

  Future<CepResponse> updateCep(String objectId, String postalCode) async {
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

    CepModel updatedCepModel = await cepRepository.update(cepModel);

    int indexOfCep = cepList.indexWhere(
        (CepModel cepModel) => cepModel.objectId == updatedCepModel.objectId);

    cepList[indexOfCep].address = updatedCepModel.address;
    cepList[indexOfCep].complement = updatedCepModel.complement;
    cepList[indexOfCep].neighborhood = updatedCepModel.neighborhood;
    cepList[indexOfCep].city = updatedCepModel.city;
    cepList[indexOfCep].state = updatedCepModel.state;
    cepList[indexOfCep].ibge = updatedCepModel.ibge;
    cepList[indexOfCep].gia = updatedCepModel.gia;
    cepList[indexOfCep].ddd = updatedCepModel.ddd;
    cepList[indexOfCep].siafi = updatedCepModel.siafi;

    cepList.refresh();

    CepResponse response = CepResponse(
      error: false,
      data: updatedCepModel,
      message: "Cep encontrado com sucesso.",
      title: "Sucesso!",
    );

    if (response.error) {
      await Get.dialog(FeedBackDialog(response: response));
    }

    return response;
  }

  Future<CepResponse> delete(CepModel cep) async {
    final cepRespository = CepRepository();
    await cepRespository.delete(cep.objectId!);

    CepResponse cepResponse = CepResponse(
        error: false,
        data: [CepModel(objectId: cep.objectId)],
        message: "Cep removido com sucesso.",
        title: "Sucesso!");
    CepModel oldCep = cepResponse.data.first;
    cepList.removeWhere(
        (CepModel localCep) => localCep.objectId == oldCep.objectId);

    await Get.dialog(FeedBackDialog(response: cepResponse));
    if (!cepResponse.error) Get.back();
    return cepResponse;
  }

  Future<CepResponse> searchAndSave(String seekedCep) async {
    CepResponse searchResponse = await search(seekedCep);

    ViaCepModel viaCepModel = searchResponse.data ?? ViaCepModel();
    CepResponse saveResponse = await add(cep: viaCepModel.toCepModel());

    return saveResponse;
  }
}
