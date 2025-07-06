import 'package:flutter/material.dart';
import 'package:streaky/core/theming/colors.dart';
import 'package:streaky/core/theming/styles.dart';
import 'package:streaky/core/utils/extensions.dart';
import 'package:streaky/core/utils/spacing.dart';
import 'package:streaky/core/widgets/custom_app_button.dart';
import 'package:streaky/core/widgets/custom_drop_down_with_title.dart';
import 'package:streaky/core/widgets/custom_text_form_field.dart';
import 'package:streaky/presentation/view/widgets/home/icons_grid.dart';


class AddHabitBottomSheet extends StatelessWidget {
  const AddHabitBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets, 
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.95,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(child: Icon(Icons.cancel_outlined), onTap: (){context.pop();},),
                    horizontalSpace(context, 16),
                    Text(
                      "Let's start a new habit",
                      style: CustomTextStyles.font24BlackBold(context),
                    ),
                  ],
                ),
                verticalSpace(context, 24),
                Text(
                  'Name',
                  style: CustomTextStyles.font14Blackregular(context),
                ),
                verticalSpace(context, 10),
                CustomTextFormField(
                  validator: (validator){}, 
                  hintText: 'Type habit name'
                ),
                verticalSpace(context, 16),
                Text(
                  'Description',
                  style: CustomTextStyles.font14Blackregular(context),
                ),
                verticalSpace(context, 10),
                CustomTextFormField(
                  validator: (validator){}, 
                  hintText: 'Describe a habit'
                ),
                verticalSpace(context, 16),
                CustomDropdownWithTitle(
                  title: 'Intervals', 
                  items: [], 
                  value: '', 
                  onChanged: (onChanged){},
                  hintText: 'Everyday',
                ),
                verticalSpace(context, 16),
                Text(
                  'Icon',
                  style: CustomTextStyles.font14Blackregular(context),
                ),
                verticalSpace(context, 10),
                IconsGrid(),
                CustomAppButton(
                  onPressed: (){},
                  btnText: 'Add',
                  backgroundColor: ColorsManager.mainColor,
                  textStyle: CustomTextStyles.font24WhiteMedium(context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

