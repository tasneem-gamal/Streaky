import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streaky/core/theming/colors.dart';
import 'package:streaky/core/theming/styles.dart';
import 'package:streaky/core/utils/extensions.dart';
import 'package:streaky/core/utils/spacing.dart';
import 'package:streaky/core/widgets/custom_app_button.dart';
import 'package:streaky/core/widgets/custom_drop_down_with_title.dart';
import 'package:streaky/core/widgets/custom_text_form_field.dart';
import 'package:streaky/data/models/habit_model.dart';
import 'package:streaky/data/models/icon_model.dart';
import 'package:streaky/presentation/controllers/bloc/habit_bloc.dart';
import 'package:streaky/presentation/view/widgets/home/icons_grid.dart';


class AddHabitBottomSheet extends StatefulWidget {
  const AddHabitBottomSheet({
    super.key,
  });

  @override
  State<AddHabitBottomSheet> createState() => _AddHabitBottomSheetState();
}

class _AddHabitBottomSheetState extends State<AddHabitBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final nameContorller = TextEditingController();
  final descriptionContorller = TextEditingController();
  final intervalsContorller = TextEditingController();
  String? selectedInterval;
  final List<String> intervalsList = [
  'Everyday',
  'Every Week',
  'Every Month',
  'Weekdays',
  'Weekends',
  'Every 2 days',
  'Every Monday',
  'Every Friday',
  'Twice a week',
  '3 times a week',
  'Once a month',
  ];
  IconModel? selectedIcon;



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.95,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Form(
            key: formKey,
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
                  controller: nameContorller,
                  validator: fieldValidation, 
                  hintText: 'Type habit name'
                ),
                verticalSpace(context, 16),
                Text(
                  'Description',
                  style: CustomTextStyles.font14Blackregular(context),
                ),
                verticalSpace(context, 10),
                CustomTextFormField(
                  controller: descriptionContorller,
                  validator: fieldValidation, 
                  hintText: 'Describe a habit'
                ),
                verticalSpace(context, 16),
                CustomDropdownWithTitle(
                  title: 'Intervals', 
                  items: intervalsList, 
                  value: selectedInterval, 
                  onChanged: (value){
                    setState(() {
                      selectedInterval = value;
                      intervalsContorller.text = value ?? '';
                    });
                  },
                  hintText: 'Everyday',
                ),
                verticalSpace(context, 16),
                Text(
                  'Icon',
                  style: CustomTextStyles.font14Blackregular(context),
                ),
                verticalSpace(context, 10),
                IconsGrid(
                  onIconSelected: (icon){
                    setState(() {
                      selectedIcon = icon;
                    });
                  },
                ),
                CustomAppButton(
                  onPressed: (){
                    final newHabit = HabitModel(
                      habitName: nameContorller.text, 
                      habitDescription: descriptionContorller.text, 
                      habitInterval: intervalsContorller.text,
                      habitIconCodePoint: selectedIcon!.icon.codePoint
                    );
                    context.read<HabitBloc>().add(AddHabit(newHabit));
                    context.pop();
                  },
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

  fieldValidation(value) {
    if (value == null) {
      return 'Field cannot be empty';
    }
    return null;
  }
}

