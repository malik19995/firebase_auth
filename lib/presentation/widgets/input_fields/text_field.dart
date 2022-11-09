import 'package:firebase_auth_demo/presentation/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Default textInputAction is next. For last field use 'done'.
class CustomTextInputField extends StatefulWidget {
  const CustomTextInputField(
      {Key? key,
      required this.label,
      this.isRequired = false,
      this.isEnabled = true,
      this.isLocationField = false,
      this.onChanged,
      this.hintText,
      this.initialValue = '',
      this.validator,
      this.maxLength,
      this.textInputAction = TextInputAction.next,
      this.isNumberField = false})
      : super(key: key);
  final String label;
  final bool isRequired;
  final String? hintText;
  final String? Function(String?)? validator;
  final int? maxLength;
  final String initialValue;
  final bool isEnabled;
  final bool isNumberField;
  final bool isLocationField;
  final TextInputAction textInputAction;
  final Function(String s)? onChanged;

  @override
  State<CustomTextInputField> createState() => _CustomTextInputFieldState();
}

class _CustomTextInputFieldState extends State<CustomTextInputField> {
  late TextEditingController _textEditingController;
  @override
  initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.initialValue);
  }

  @override
  void didChangeDependencies() {
    _textEditingController.text = widget.initialValue;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: widget.label,
                  style: const TextStyle(
                      color: Color(0xff727272),
                      fontWeight: FontWeight.w700,
                      fontSize: 14)),
              if (widget.isRequired)
                const TextSpan(text: "*", style: TextStyle(color: Colors.red))
            ],
          ),
        ),
        sized(
          h: 8,
        ),
        TextFormField(
          enabled: widget.isEnabled,
          controller: _textEditingController,
          // onChanged: widget.onChanged,
          style: !widget.isEnabled
              ? const TextStyle(
                  color: Color(0xffC8C8C8),
                  fontSize: 14,
                  fontWeight: FontWeight.w400)
              : null,
          onSaved: (s) {
            if (widget.onChanged != null) widget.onChanged!(s ?? '');
          },
          validator: (s) {
            if (widget.isRequired && (s != null && s.isEmpty)) {
              return "Required Field";
            }
            if (widget.validator != null && s != null && s.isNotEmpty) {
              return widget.validator!(s);
            }
            return null;
          },
          maxLength: widget.maxLength,
          inputFormatters: widget.isNumberField
              ? [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ]
              : [],

          keyboardType: widget.isNumberField ? TextInputType.number : null,
          textInputAction: widget.textInputAction,
          decoration: InputDecoration(
              hintText: widget.hintText,
              suffixIcon: widget.isLocationField
                  ? const Icon(Icons.location_pin, color: Color(0xff5E5E5E))
                  : null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: Color(0xffDEDEDE),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: Color(0xffDEDEDE),
                ),
              )),
        )
      ],
    );
  }
}
