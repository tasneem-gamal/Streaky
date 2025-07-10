import 'package:flutter/material.dart';
import 'package:streaky/core/theming/colors.dart';
import 'package:streaky/data/models/icon_model.dart';

class IconsGrid extends StatefulWidget {
  const IconsGrid({super.key, required this.onIconSelected});
  final void Function(IconModel) onIconSelected;

  @override
  State<IconsGrid> createState() => _IconsGridState();
}

class _IconsGridState extends State<IconsGrid> {
  IconModel? selectedIcon;

  final List<IconModel> iconsList = [
    IconModel(Icons.local_drink, 'Drink Water'),
    IconModel(Icons.directions_run, 'Exercise'),
    IconModel(Icons.book, 'Read'),
    IconModel(Icons.self_improvement, 'Meditate'),
    IconModel(Icons.nightlight_round, 'Sleep Early'),
    IconModel(Icons.fastfood, 'Eat Healthy'),
    IconModel(Icons.brush, 'Brush Teeth'),
    IconModel(Icons.sunny, 'Morning Walk'),
    IconModel(Icons.not_interested, 'No Sugar'),
    IconModel(Icons.phone_disabled, 'Digital Detox'),
  ];

  @override
  Widget build(BuildContext context) {
    final int rows = (iconsList.length / 5).ceil();
    final double gridHeight = rows * 170;
    return SizedBox(
      height: gridHeight,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: iconsList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          final icon = iconsList[index];
          final isSelected = selectedIcon == icon;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIcon = icon;
              });
              widget.onIconSelected(icon);
            },
            child: Container(
              decoration: BoxDecoration(
                color:
                    isSelected
                        ? ColorsManager.mainColorLight
                        : ColorsManager.greenShade,
                border: Border.all(
                  color:
                      isSelected ? ColorsManager.mainColor : Colors.transparent,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: Icon(icon.icon)),
            ),
          );
        },
      ),
    );
  }
}
