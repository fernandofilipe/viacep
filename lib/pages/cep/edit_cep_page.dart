import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viacep/controllers/cep_controller.dart';
import 'package:viacep/models/cep_model.dart';
import 'package:viacep/shared/layout/theme.dart';
import 'package:viacep/shared/widgets/custom_app_bar.dart';
import 'package:viacep/shared/widgets/dropdown_form_field.dart';
import 'package:viacep/shared/widgets/input_form_field.dart';
import 'package:viacep/shared/widgets/string_input.dart';

class EditCepPage extends StatefulWidget {
  final CepModel cep;
  const EditCepPage({super.key, required this.cep});

  @override
  State<EditCepPage> createState() => _EditCepPageState();
}

class _EditCepPageState extends State<EditCepPage> {
  final CepController _cepController = Get.put(CepController());

  @override
  void initState() {
    super.initState();
    FocusManager.instance.primaryFocus?.unfocus();
    _cepController.init(widget.cep);
  }

  @override
  void dispose() {
    super.dispose();
    _cepController.disposeControllers();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(isEditingAppBar: true),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Alterar Cep: ${widget.cep.postalCode}",
                  style: headingStyle,
                ),
                const SizedBox(height: 10),
                InputFormField(
                  widget: StringInput(
                    hint: "Digite o Logradouro ...",
                    controller: _cepController.addressController,
                  ),
                ),
                InputFormField(
                  widget: StringInput(
                    hint: "Digite o Complemento ...",
                    controller: _cepController.complementController,
                  ),
                ),
                InputFormField(
                  widget: StringInput(
                    hint: "Digite o Bairro ...",
                    controller: _cepController.neighborhoodController,
                  ),
                ),
                InputFormField(
                  widget: StringInput(
                    hint: "Digite a Localidade ...",
                    controller: _cepController.cityController,
                  ),
                ),
                InputFormField(
                  widget: DropdownFormField(
                    hint: 'Escolha a UF ...',
                    value: _cepController.stateController.text,
                    items: Estados.listaEstadosSigla,
                    onChange: (String? selectedState) {
                      _cepController.stateController.text = selectedState ?? "";
                      setState(() {});
                    },
                  ),
                ),
                InputFormField(
                  widget: StringInput(
                    hint: "Digite o número IBGE ...",
                    controller: _cepController.ibgeController,
                  ),
                ),
                InputFormField(
                  widget: StringInput(
                    hint: "Digite o Gia ...",
                    controller: _cepController.giaController,
                  ),
                ),
                InputFormField(
                  widget: StringInput(
                    hint: "Digite o DDD ...",
                    controller: _cepController.dddController,
                  ),
                ),
                InputFormField(
                  widget: StringInput(
                    hint: "Digite a Siafi ...",
                    controller: _cepController.siafiController,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    setState(() {
                      if (widget.cep.objectId != null &&
                          widget.cep.postalCode != null) {
                        _cepController.updateCep(
                            widget.cep.objectId!, widget.cep.postalCode!);

                        Get.back();
                        Get.back();
                      }
                    });
                  },
                  child: const Text("Salvar"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
