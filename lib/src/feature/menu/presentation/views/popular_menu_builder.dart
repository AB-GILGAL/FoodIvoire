
// import 'package:flutter/material.dart';
// import 'package:foodivoire/src/feature/menu/domain/entities/menu_model.dart';
// import 'package:foodivoire/src/feature/menu/presentation/provider/popular_menu_provider.dart';
// import 'package:foodivoire/src/feature/menu/presentation/views/menu_detail.dart';
// import 'package:foodivoire/src/shared/constant/colors.dart';
// import 'package:foodivoire/src/shared/utils/show.snacbar.dart';
// import 'package:provider/provider.dart';

// class PopularMenuBuilder extends StatefulWidget {
//   const PopularMenuBuilder({Key? key, this.menu}) : super(key: key);
//   final dynamic menu;

//   @override
//   State<PopularMenuBuilder> createState() => _PopularMenuBuilderState();
// }

// class _PopularMenuBuilderState extends State<PopularMenuBuilder> {
//   int isSelected = 0;
//   Future<List<MenuDataModel>>? popularMenus;

//   fetchPopularMenus() async {
//     final result =
//         await context.read<PopularMenuProvider>().fetchPopularMenus();

//     result.fold(
//       (failure) =>
//           showCustomSnackBar(context, failure.message, orange),
//       (success) {
//         if (mounted) {
//           setState(() {
//             popularMenus = Future.value(success);
//           });
//         }
//       },
//     );
//   }

//   @override
//   void initState() {
//     fetchPopularMenus();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: popularMenus,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(
//             child: Text('Error: ${snapshot.error}'),
//           );
//         } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
//           final popularMenus = snapshot.data!;
//           return ListView.separated(
//             separatorBuilder: (context, index) => SizedBox(
//               width: MediaQuery.sizeOf(context).width * 0.05,
//             ),
//             shrinkWrap: true,
//             itemCount: popularMenus.length,
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (context, index) {
//               var popularMenu = popularMenus[index];

//               return FoodCard(
//                 popularMenus: popularMenu,
//                 index: index,
//                 isSelectedIndex: null,
//                 onTap: () {
//                   setState(
//                     () {
//                       isSelected = index;
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return MenuDetailView(
//                               menu: popularMenu,
//                             );
//                           },
//                         ),
//                       );
//                     },
//                   );
//                 },
//               );
//             },
//           );
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return const Center(child: Text('No menu available.'));
//         }
//         return const Center(child: CircularProgressIndicator());
//       },
//     );
//   }
// }

// class FoodCard extends StatelessWidget {
//   final MenuDataModel popularMenus;
//   final int index;
//   final int? isSelectedIndex;
//   final void Function()? onTap;

//   const FoodCard({
//     required this.popularMenus,
//     required this.index,
//     required this.isSelectedIndex,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 15).copyWith(left: 2),
//         child: Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: white,
//               boxShadow: [
//                 BoxShadow(
//                     color: grey.withOpacity(0.4),
//                     offset: const Offset(0, 0),
//                     blurRadius: 2,
//                     spreadRadius: 2)
//               ]),
//           width: MediaQuery.sizeOf(context).width * 0.55,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: MediaQuery.sizeOf(context).height * .15,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     image: DecorationImage(
//                         image:
//                             NetworkImage(popularMenus.banner),
//                         fit: BoxFit.cover),
//                   ),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.sizeOf(context).height * .01,
//                 ),
//                 Text(
//                   popularMenus.name,
//                   style: const TextStyle(fontWeight: FontWeight.w700),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.sizeOf(context).height * .012,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       popularMenus.origin,
//                       style: const TextStyle(color: orange),
//                     ),
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.favorite_border_outlined,
//                           size: 15,
//                         ),
//                         SizedBox(
//                           width: MediaQuery.sizeOf(context).width * .01,
//                         ),
//                         Text(
//                           popularMenus.like.toString(),
//                           style: const TextStyle(fontWeight: FontWeight.w500),
//                         )
//                       ],
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:foodivoire/presentation/home.dart';
import 'package:foodivoire/src/feature/menu/domain/entities/menu_model.dart';
import 'package:foodivoire/src/feature/menu/presentation/provider/popular_menu_provider.dart';
import 'package:foodivoire/src/feature/menu/presentation/views/menu_detail.dart';
import 'package:foodivoire/src/shared/constant/colors.dart';
import 'package:foodivoire/src/shared/utils/show.snacbar.dart';
import 'package:provider/provider.dart';

class PopularMenuBuilder extends StatefulWidget {
  const PopularMenuBuilder({Key? key}) : super(key: key);

  @override
  State<PopularMenuBuilder> createState() => _PopularMenuBuilderState();
}

class _PopularMenuBuilderState extends State<PopularMenuBuilder> {
  int isSelected = 0;
  late Future<List<MenuDataModel>> popularMenus;
  late List<MenuDataModel> filteredMenus = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    popularMenus = fetchPopularMenus();
  }

  Future<List<MenuDataModel>> fetchPopularMenus() async {
    final result =
        await context.read<PopularMenuProvider>().fetchPopularMenus();

    return result.fold(
      (failure) {
        showCustomSnackBar(context, failure.message, orange);
        return [];
      },
      (success) {
        setState(() {
          filteredMenus = success;
        });
        return success;
      },
    );
  }

  void filterMenus(String query) async {
  List<MenuDataModel> allMenus = await popularMenus;

  setState(() {
    if (query.isEmpty) {
      filteredMenus = List.from(allMenus);
    } else {
      filteredMenus = allMenus
          .where((menu) => menu.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            controller: _searchController,
            onChanged: filterMenus,
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: FutureBuilder<List<MenuDataModel>>(
            future: popularMenus,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (filteredMenus.isEmpty) {
                return const Center(child: Text('No matching menu.'));
              } else {
                return ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.05,
                  ),
                  shrinkWrap: true,
                  itemCount: filteredMenus.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var popularMenu = filteredMenus[index];

                    return FoodCard(
                      popularMenus: popularMenu,
                      index: index,
                      isSelectedIndex: null,
                      onTap: () {
                        setState(() {
                          isSelected = index;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return MenuDetailView(
                                  menu: popularMenu,
                                );
                              },
                            ),
                          );
                        });
                      },
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
