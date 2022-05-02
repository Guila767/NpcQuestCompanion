import 'package:elden_ring_quest_guide/src/app_assets.dart';
import 'package:elden_ring_quest_guide/src/app_colors.dart';
import 'package:elden_ring_quest_guide/src/view/npc_list/inputbar.dart';
import 'package:flutter/material.dart';

class NpcListViewAppbar extends StatefulWidget implements PreferredSizeWidget {
  
  final String title;
  final Color bgColor;
  final TextEditingController? searchController;
  final void Function(String)? searchOnChanged;
  
  const NpcListViewAppbar({ Key? key, required this.bgColor, this.searchController, this.searchOnChanged, required this.title }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(180);

  @override
  State<NpcListViewAppbar> createState() => _NpcListViewAppbarState();
}

class _NpcListViewAppbarState extends State<NpcListViewAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: widget.bgColor,
        image: DecorationImage(
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
          image: Image.asset(AppImages.art0).image
        ),
        boxShadow: [ 
          BoxShadow(
            color: Colors.grey.shade500,
            spreadRadius: -5,
            blurRadius: 12,
            offset: const Offset(0, 2)
          )
        ]
      ),

      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
                        Icons.menu,
                        color: AppColors.white,
                        size: 24),
                    onPressed: () => Scaffold.of(context).openDrawer()
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18.0),
                  ),
                ],
              ),
              Expanded(
                child: Inputbar(
                  placeholder: "Filter NPCs",
                  controller: widget.searchController,
                  onChanged: widget.searchOnChanged,
                  autofocus: false,
                  suffixIcon: const Icon(Icons.zoom_in, color: Colors.grey),
                ),
              ),
              const SizedBox(height:20)
            ],
          ),
        ),
      ),
    );
  }
}