import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/menu/domain/entities/menu_model.dart';
import 'package:foodivoire/src/feature/menu/presentation/provider/menu_provider.dart';
import 'package:foodivoire/src/feature/menu/presentation/views/menu_detail.dart';
import 'package:foodivoire/src/feature/menu/presentation/widget/menu_card.dart';
import 'package:foodivoire/src/shared/constant/colors.dart';
import 'package:foodivoire/src/shared/utils/show.snacbar.dart';
import 'package:provider/provider.dart';


class MenuBuilder extends StatefulWidget {
  const MenuBuilder({super.key});

  @override
  State<MenuBuilder> createState() => _MenuBuilderState();
}

class _MenuBuilderState extends State<MenuBuilder> {

Future<List<MenuDataModel>>? menus;
  fetchMenus() async {
    final result =
        await context.read<MenuProvider>().fetchMenus();

    result
        .fold((failure) => showCustomSnackBar(context, failure.message, orange),
            (success) {
      if (mounted) {
        setState(() {
          menus = Future.value(success);
        });
      }
    });
  }

  @override
  void initState() {
    fetchMenus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: menus, builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final menus =  snapshot.data!;
                return     ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.03,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: menus.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final menu =menus[index];
                  final id = menu.id;
                  final name = menu.name;
                  final price = menu.price;
                  final description = menu.description;
                  final origin = menu.origin;
                  final banner = menu.banner;
                  final like = menu.like;
                  final likeStatus = menu.likeStatus;
                  final comments = menu.comments;
                  final restaurant = menu.restaurant;
                  final preferences = menu.preferences;
                  final allergies = menu.allergies;
                  final createdAt = menu.createdAt;
                  final updatedAt = menu.updatedAt;

                  return AvailableMenu(
                      menu: MenuDataModel(id: id, name: name, price: price, description: description, origin: origin, banner: banner, like: like, likeStatus: likeStatus, comments: comments, restaurant: restaurant, preferences: preferences, allergies: allergies, createdAt: createdAt, updatedAt: updatedAt),
                      index: index,
                      isSelectedIndex:null ,
                      onTap: () {
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              final menu = MenuDataModel(id: id, name: name, price: price, description: description, origin: origin, banner: banner, like: like, likeStatus: likeStatus, comments: comments, restaurant: restaurant, preferences: preferences, allergies: allergies, createdAt: createdAt, updatedAt: updatedAt,);
                              return  MenuDetailView(
                                menu: menu
                              );
                            },
                          ));
                        });
                      });
                });
      }   else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No menu available.'));
          }
          return const Center(child: CircularProgressIndicator());
          
      },);
  }
}