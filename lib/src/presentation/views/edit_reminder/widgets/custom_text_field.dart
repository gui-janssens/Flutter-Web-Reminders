import 'package:codelitt_calendar/src/utils/utlls.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Function(String) onChanged;
  final String? initialValue;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool hasError;
  final String? errorText;
  final TextEditingController? controller;
  final int minLines;
  final int maxLines;
  final String? counter;
  final TextCapitalization textCapitalization;
  final Function(String)? onFieldSubmitted;
  final double height;

  const CustomTextField({
    super.key,
    this.counter,
    this.hintText,
    this.minLines = 1,
    this.maxLines = 1,
    this.textCapitalization = TextCapitalization.none,
    this.controller,
    this.errorText,
    this.onFieldSubmitted,
    required this.onChanged,
    this.inputFormatters,
    this.height = 48,
    this.hasError = false,
    this.initialValue,
    this.keyboardType = TextInputType.multiline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          width: 1,
          color: hasError
              ? Colors.red
              : AppColors.textFieldGreyColor.withOpacity(.4),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              textCapitalization: textCapitalization,
              onFieldSubmitted: onFieldSubmitted,
              onEditingComplete: () {
                FocusScope.of(context).nextFocus();
              },
              controller: controller,
              textAlign: TextAlign.start,
              onChanged: (t) => onChanged(t),
              inputFormatters: inputFormatters ?? [],
              keyboardType: keyboardType,
              initialValue: initialValue,
              minLines: minLines,
              maxLines: maxLines,
              cursorColor: Colors.black,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                isDense: true,
                counter: counter != null
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(counter!),
                      )
                    : null,
                suffixIconConstraints: const BoxConstraints(
                  maxHeight: 30,
                  maxWidth: 100,
                  minWidth: 30,
                ),
                errorText: errorText,
                disabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                filled: true,
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: AppColors.textFieldGreyColor.withOpacity(.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
