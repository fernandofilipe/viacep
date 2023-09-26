import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viacep/models/cep_model.dart';

class CepTile extends StatelessWidget {
  final CepModel cep;
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
          color: context.theme.primaryColorDark,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const Divider(
              color: Colors.white,
            ),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  _buildHeader() {
    return Row(
      children: [
        _buildHeaderItem('CEP: ${cep.postalCode}', Icons.mail),
        Expanded(
          child: Container(),
        ),
        _buildHeaderItem(cep.objectId.toString(), Icons.key),
      ],
    );
  }

  _buildHeaderItem(String label, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          label,
          style: GoogleFonts.lato(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  _buildContent() {
    return Column(
      children: [
        _buildContentItem("Localidade", '${cep.city} - ${cep.state}'),
        _buildContentItem("Logradouro", cep.address ?? "-"),
        _buildContentItem("Complemento", cep.complement ?? "-"),
        _buildContentItem("Bairro", cep.neighborhood ?? "-"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildContentItem("Ibge", cep.ibge ?? "-"),
            _buildContentItem("Gia", cep.gia ?? "-"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildContentItem("DDD", cep.ddd ?? "-"),
            _buildContentItem("Siafi", cep.siafi ?? "-"),
          ],
        ),
      ],
    );
  }

  _buildContentItem(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '$title: ',
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          value,
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
