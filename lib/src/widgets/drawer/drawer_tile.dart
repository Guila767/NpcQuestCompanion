import 'package:elden_ring_quest_guide/src/app_colors.dart';
import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final IconData? icon;
  final void Function()? onTap;
  final bool isSelected;
  final Color iconColor;

  const DrawerTile(
      {required this.title,
      this.icon,
      this.onTap,
      this.isSelected = false,
      this.iconColor = Colors.black,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.only(top: 6),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: isSelected
                        ? Colors.black.withOpacity(0.1)
                        : Colors.transparent,
                    offset: const Offset(0, 0.5),
                    spreadRadius: 3,
                    blurRadius: 10)
              ],
              color: AppColors.blue700,
              borderRadius: const BorderRadius.all(Radius.circular(54))),
          child: Row(
            children: [
              Icon(
                icon,
                size: 18,
                color: isSelected
                    ? AppColors.orange500
                    : Colors.white.withOpacity(0.6),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  title,
                  style: TextStyle(
                    letterSpacing: .3,
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                    color: isSelected
                        ? AppColors.orange500
                        : Colors.white.withOpacity(0.8),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
