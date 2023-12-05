import 'package:flutter/material.dart';
import 'package:foodivoire/presentation/home.dart';
import 'package:foodivoire/src/feature/menu/domain/entities/menu_model.dart';
import 'package:foodivoire/src/feature/menu/presentation/provider/suggested_menu_provider.dart';
import 'package:foodivoire/src/feature/menu/presentation/views/menu_detail.dart';
import 'package:foodivoire/src/shared/constant/colors.dart';
import 'package:foodivoire/src/shared/utils/show.snacbar.dart';
import 'package:provider/provider.dart';

class SuggestedMenuBuilder extends StatefulWidget {
  const SuggestedMenuBuilder({super.key});

  @override
  State<SuggestedMenuBuilder> createState() => _SuggestedMenuBuilderState();
}

class _SuggestedMenuBuilderState extends State<SuggestedMenuBuilder> {
  int isSelected = 0;

  Future<List<MenuDataModel>>? suggestedMenus;
  fetchSuggestedMenus() async {
    final result =
        await context.read<SuggestedMenuProvider>().fetchSuggestedMenus();

    result
        .fold((failure) => showCustomSnackBar(context, failure.message, orange),
            (success) {
      if (mounted) {
        setState(() {
          suggestedMenus = Future.value(success);
        });
      }
    });
  }

  @override
  void initState() {
    fetchSuggestedMenus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: suggestedMenus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          final suggestedMenus = snapshot.data!;
          return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.05,
                  ),
              shrinkWrap: true,
              itemCount: suggestedMenus.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // final restaurant = suggestedsuggestedMenus[index];
                // final img = restaurant["image"];
                // final name = restaurant["name"];
                // final distance = restaurant["distance"];

                var suggestedMenu = suggestedMenus[index];

                return FoodCard1(
                    suggestedMenus: suggestedMenu,
                    index: index,
                    isSelectedIndex: null,
                    onTap: () {
                      setState(() {
                        isSelected = index;
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return MenuDetailView(
                              menu: suggestedMenu,
                            );
                          },
                        ));
                      });
                    });
              });
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No menu available.'));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
