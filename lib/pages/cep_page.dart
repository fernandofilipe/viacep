import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viacep/controllers/cep_controller.dart';
import 'package:viacep/shared/widgets/cep_tile.dart';
import 'package:viacep/shared/widgets/custom_app_header.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:viacep/shared/widgets/edit_bottom_sheet.dart';

class CepPage extends StatefulWidget {
  const CepPage({super.key});

  @override
  State<CepPage> createState() => _CepPageState();
}

class _CepPageState extends State<CepPage> {
  final CepController _cepController = Get.put(CepController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppHeader(),
        _showCepList(),
      ],
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
                            Get.bottomSheet(
                              EditBottomSheet(
                                buildContext: context,
                                editTitle: "Editar Medida",
                                deleteTitle: "Remover Medida",
                                onEditAction: () {},
                                onDeleteAction: () {
                                  _cepController
                                      .delete(_cepController.cepList[index]);
                                },
                              ),
                            );
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
}
