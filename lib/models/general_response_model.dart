import 'package:viacep/models/user.dart';

abstract class GeneralResponseModel {
  bool error;
  String title;
  String message;
  dynamic data;

  GeneralResponseModel({
    this.error = false,
    this.title = "",
    this.message = "",
    this.data,
  });
}

class CepResponse extends GeneralResponseModel {
  CepResponse({
    bool error = false,
    String title = "",
    String message = "",
    dynamic data,
  }) : super(error: error, title: title, message: message, data: data);
}

class UserResponse extends GeneralResponseModel {
  UserResponse({
    bool error = false,
    String title = "",
    String message = "",
    List<User>? data,
  }) : super(error: error, title: title, message: message, data: data);
}
