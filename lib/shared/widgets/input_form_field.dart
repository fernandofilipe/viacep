import 'package:flutter/material.dart';

class InputFormField extends StatelessWidget {
  final Widget? widget;
  final Widget? sufixWidget;
  const InputFormField({
    super.key,
    required this.widget,
    this.sufixWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              widget == null ? Container() : Expanded(child: widget!),
              sufixWidget == null ? Container() : Container(child: sufixWidget),
            ],
          ),
        ],
      ),
    );
  }
}
