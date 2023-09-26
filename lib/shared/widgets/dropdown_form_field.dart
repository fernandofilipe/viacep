import 'package:flutter/material.dart';
import 'package:viacep/shared/layout/theme.dart';

class DropdownFormField extends StatelessWidget {
  final List<String> items;
  final String? hint;
  final void Function(String?)? onChange;
  final String? value;
  const DropdownFormField({
    super.key,
    required this.items,
    this.hint,
    this.onChange,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      hint: Text(hint ?? "", style: subTitleStyle),
      onChanged: onChange,
      value: value,
      items: items.map<DropdownMenuItem<String>>((String estado) {
        return DropdownMenuItem(
          value: estado,
          child: Text(estado),
        );
      }).toList(),
    );
  }
}
