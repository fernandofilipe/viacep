import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:viacep/controllers/cep_controller.dart';
import 'package:viacep/controllers/viacep_controller.dart';
import 'package:viacep/models/cep_model.dart';
import 'package:viacep/pages/cep/edit_cep_page.dart';
import 'package:viacep/shared/widgets/cep_tile.dart';
import 'package:viacep/shared/widgets/custom_app_header.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:viacep/shared/widgets/edit_bottom_sheet.dart';
import 'package:brasil_fields/brasil_fields.dart';

class CepPage extends StatefulWidget {
  const CepPage({super.key});

  @override
  State<CepPage> createState() => _CepPageState();
}

class _CepPageState extends State<CepPage> {
  final CepController _cepController = Get.put(CepController());
  final ViaCepController _viaCepController = Get.put(ViaCepController());

  bool loading = false;

  @override
  void initState() {
    super.initState();
    load();
  }

  load() async {
    setState(() {
      loading = true;
    });
    await _cepController.get();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppHeader(),
        const SizedBox(height: 10),
        _buildSearchField(),
        const SizedBox(height: 10),
        loading
            ? const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : _showCepList(),
      ],
    );
  }

  _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              label: Text("Digite o CEP"),
            ),
            controller: _viaCepController.searchController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CepInputFormatter(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
            label: const Text("Pesquisar"),
            icon: const Icon(Icons.search),
            style: ElevatedButton.styleFrom(
              backgroundColor: context.theme.primaryColorDark,
              foregroundColor: Colors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              minimumSize: const Size(double.infinity, 40),
            ),
            onPressed: () async {
              var cep = _viaCepController.searchController.text
                  .replaceAll(RegExp(r'[^0-9]'), '');

              if (cep.length == 8) {
                setState(() {
                  loading = true;
                });

                FocusManager.instance.primaryFocus?.unfocus();
                await _cepController.searchAndSave(cep);

                setState(() {
                  loading = false;
                });
              }
            },
          ),
        ],
      ),
    );
  }

  _showCepList() {
    return Expanded(
      child: Obx(
        () {
          return ListView.builder(
            itemCount: _cepController.cepList.length,
            itemBuilder: (_, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                child: SlideAnimation(
                  child: FadeInAnimation(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _showBottomMenu(_cepController.cepList[index]);
                          },
                          child: CepTile(
                            cep: _cepController.cepList[index],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  _showBottomMenu(CepModel cepModel) async {
    await Get.bottomSheet(
      EditBottomSheet(
        buildContext: context,
        editTitle: "Editar CEP",
        deleteTitle: "Remover CEP",
        onEditAction: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (_) {
              return EditCepPage(cep: cepModel);
            },
          ));
        },
        onDeleteAction: () async {
          setState(() {
            loading = true;
          });
          Get.back();
          await _cepController.delete(cepModel);
          setState(() {
            loading = false;
          });
        },
      ),
    );
  }
}
