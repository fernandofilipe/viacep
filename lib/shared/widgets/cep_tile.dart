import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viacep/models/cep.dart';

class CepTile extends StatelessWidget {
  final Cep cep;
  const CepTile({super.key, required this.cep});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: context.theme.cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const Divider(
              color: Colors.white,
            ),
            Row(
              children: [
                _buildMeasurementsBox(
                  "Cep",
                  "",
                  cep.cep,
                  Icons.design_services_outlined,
                ),
                _buildMeasurementsBox(
                  "Logradouro",
                  "",
                  cep.logradouro,
                  Icons.fitness_center_outlined,
                ),
                _buildMeasurementsBox(
                  "Bairro",
                  "",
                  cep.bairro,
                  Icons.balance,
                ),
                _buildVerticalLine(),
                _buildVerticalBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildHeader() {
    return Row(
      children: [
        const Icon(
          Icons.person_outline_sharp,
          color: Colors.white,
          size: 24,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          "#${cep.id} - ${cep.uf}",
          style: GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Container(),
        ),
        const Icon(
          Icons.calendar_month,
          color: Colors.white,
          size: 20,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          cep.updatedAt,
          style: GoogleFonts.lato(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  _buildMeasurementsBox(String title, String unitOfmeasurement,
      String measurement, IconData icon) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.grey[200],
                size: 18,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                "$measurement $unitOfmeasurement",
                style: GoogleFonts.lato(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[200],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildVerticalLine() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      width: 0.5,
      color: Colors.grey[200]!.withOpacity(0.7),
    );
  }

  _buildVerticalBox() {
    return RotatedBox(
      quarterTurns: 3,
      child: Text(
        cep.ibge.toString(),
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
