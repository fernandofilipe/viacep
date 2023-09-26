import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:viacep/base_app.dart';
import 'package:viacep/shared/constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  final box = GetStorage();

  box.write('initials', 'FR');
  await dotenv.load(fileName: ".env");

  Intl.defaultLocale = Constants.appLocale;
  initializeDateFormatting(Constants.appLocale);
  runApp(const BaseApp());
}
