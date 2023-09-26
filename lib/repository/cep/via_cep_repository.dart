import 'package:viacep/models/via_cep_model.dart';
import 'package:viacep/repository/cep/viacep_custom_dio.dart';

class ViaCepRepository {
  final _customDio = ViaCepCustomDio();

  Future<ViaCepModel> search(String cep) async {
    var url = "/$cep/json/";

    final response = await _customDio.dio.get(url);

    if (response.statusCode == 200) {
      var cep = response.data;
      return ViaCepModel.fromJson(cep);
    }

    return ViaCepModel();
  }
}
