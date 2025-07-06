import 'package:flutter/material.dart';
import 'package:streaky/core/theming/colors.dart';
import 'package:streaky/core/theming/styles.dart';
import 'package:streaky/core/utils/spacing.dart';


class CustomDropdownWithTitle extends StatelessWidget {
  const CustomDropdownWithTitle({
    super.key,
    required this.title,
    required this.items,
    required this.value,
    required this.onChanged,
    this.validator, required this.hintText,
  });

  final String title;
  final List<String> items;
  final String hintText;
  final String? value;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: CustomTextStyles.font14Blackregular(context),),
        verticalSpace(context, 10),
        DropdownButtonFormField<String>(
          borderRadius: BorderRadius.circular(12),
          dropdownColor: ColorsManager.fieldGray,
          elevation: 2,
          isExpanded: true,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: ColorsManager.moreLightGray),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: ColorsManager.moreLightGray),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: ColorsManager.moreLightGray),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
          value: value,
          hint: Text(hintText),
          items:
              items
                  .map(
                    (item) => DropdownMenuItem(value: item, child: Text(item)),
                  )
                  .toList(),
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    );
  }
}
