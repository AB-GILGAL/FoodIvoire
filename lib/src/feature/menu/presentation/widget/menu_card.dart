import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/menu/domain/entities/menu_model.dart';
import 'package:foodivoire/src/shared/constant/colors.dart';

class AvailableMenu extends StatelessWidget {
  const AvailableMenu(
      {super.key,
      this.distance,
      this.index,
      this.isSelectedIndex,
      required this.menu,
      this.onTap});

  final MenuDataModel? menu;

  final int? distance;
  final int? index;
  final int? isSelectedIndex;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * .09,
            width: MediaQuery.sizeOf(context).width * .23,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image:
                  DecorationImage(image: NetworkImage(menu!.banner), fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * .02,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * .6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      menu!.name,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .02,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.star_border_outlined,
                          color: orange,
                        ),
                        Icon(
                          Icons.star_border_outlined,
                          color: orange,
                        ),
                        Icon(
                          Icons.star_border_outlined,
                          color: orange,
                        ),
                        Icon(
                          Icons.star_border_outlined,
                          color: grey,
                        ),
                        Icon(
                          Icons.star_border_outlined,
                          color: grey,
                        )
                      ],
                    )
                  ],
                ),
                const Row(
                  children: [
                    Icon(Icons.place_outlined),
                    Text("5 km"),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}