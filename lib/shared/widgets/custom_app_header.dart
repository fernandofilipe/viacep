import 'package:flutter/material.dart';
import 'package:viacep/shared/constants.dart';
import 'package:viacep/shared/layout/theme.dart';

class CustomAppHeader extends StatelessWidget {
  const CustomAppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Constants.appTitle,
                style: headingStyle,
              ),
              Text(
                "Busca e Salva CEPs",
                style: subHeadingStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
