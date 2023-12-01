import 'package:flutter/material.dart';
import 'package:foodivoire/presentation/home.dart';
import 'package:foodivoire/src/feature/menu/domain/entities/popular_menu_model.dart';
import 'package:foodivoire/src/feature/menu/presentation/provider/popular_menu_provider.dart';
import 'package:foodivoire/src/feature/menu/presentation/views/menu_detail.dart';
import 'package:foodivoire/src/shared/constant/colors.dart';
import 'package:foodivoire/src/shared/utils/show.snacbar.dart';
import 'package:provider/provider.dart';


class PopularMenuBuilder extends StatefulWidget {
  const PopularMenuBuilder({super.key});

  @override
  State<PopularMenuBuilder> createState() => _PopularMenuBuilderState();
}

class _PopularMenuBuilderState extends State<PopularMenuBuilder> {
  int isSelected = 0;

Future<List<PopularMenuDataModel>>? popularMenus;
  fetchPopularMenus() async {
    final result =
        await context.read<PopularMenuProvider>().fetchPopularMenus();

    result
        .fold((failure) => showCustomSnackBar(context, failure.message, orange),
            (success) {
      if (mounted) {
        setState(() {
          popularMenus = Future.value(success);
        });
      }
    });
  }

  @override
  void initState() {
    fetchPopularMenus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: popularMenus, builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final popularMenus =  snapshot.data!;
                return     ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.05,
                    ),
                shrinkWrap: true,
                itemCount: popularMenus.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  // final restaurant = popularpopularMenus[index];
                  // final img = restaurant["image"];
                  // final name = restaurant["name"];
                  // final distance = restaurant["distance"];
                  
                  var popularMenu = popularMenus[index];

                  return FoodCard(
                      popularMenus: popularMenu,
                      index: index,
                      isSelectedIndex:null ,
                      onTap: () {
                         setState(() {
                                                      isSelected = index;
                                                      Navigator.push(context,
                                                          MaterialPageRoute(
                                                        builder: (context) {
                                                          return MenuDetailView(
                                                            popularMenu: popularMenu,
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


// import 'package:flutter/material.dart';
// import 'package:foodivoire/presentation/home.dart';
// import 'package:foodivoire/src/feature/menu/domain/entities/popular_menu_model.dart';
// import 'package:foodivoire/src/feature/menu/presentation/provider/popular_menu_provider.dart';
// import 'package:foodivoire/src/feature/menu/presentation/views/menu_detail.dart';
// import 'package:foodivoire/src/shared/constant/colors.dart';
// import 'package:foodivoire/src/shared/utils/show.snacbar.dart';
// import 'package:provider/provider.dart';

// class PopularMenuBuilder extends StatefulWidget {
//   const PopularMenuBuilder({super.key});

//   @override
//   State<PopularMenuBuilder> createState() => _PopularMenuBuilderState();
// }

// class _PopularMenuBuilderState extends State<PopularMenuBuilder> {
//   int isSelected = 0;
//   TextEditingController _searchController = TextEditingController();
//   List<PopularMenuDataModel> _filteredMenus = [];

//   Future<List<PopularMenuDataModel>>? popularMenus;

//   fetchPopularMenus() async {
//     final result =
//         await context.read<PopularMenuProvider>().fetchPopularMenus();

//     result.fold(
//       (failure) => showCustomSnackBar(context, failure.message, orange),
//       (success) {
//         if (mounted) {
//           setState(() {
//             popularMenus = Future.value(success);
//             _filteredMenus = success; // Initialize filteredMenus with all menus
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

//   void filterMenus(String query) {
//     setState(() {
//       _filteredMenus = popularMenus?.then((menus) {
//         return menus.where((menu) {
//           // Implement your filtering criteria here
//           return menu.name.toLowerCase().contains(query.toLowerCase());
//         }).toList();
//       }) ?? [];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: TextField(
//             controller: _searchController,
//             onChanged: filterMenus,
//             decoration: InputDecoration(
//               hintText: 'Search...',
//               prefixIcon: Icon(Icons.search),
//             ),
//           ),
//         ),
//         Expanded(
//           child: FutureBuilder(
//             future: popularMenus,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Center(
//                   child: Text('Error: ${snapshot.error}'),
//                 );
//               } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
//                 return ListView.separated(
//                   separatorBuilder: (context, index) => SizedBox(
//                     width: MediaQuery.sizeOf(context).width * 0.05,
//                   ),
//                   shrinkWrap: true,
//                   itemCount: _filteredMenus.length,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) {
//                     var popularMenu = _filteredMenus[index];

//                     return FoodCard(
//                       popularMenus: popularMenu,
//                       index: index,
//                       isSelectedIndex: null,
//                       onTap: () {
//                         setState(() {
//                           isSelected = index;
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) {
//                                 return MenuDetailView(
//                                   popularMenu: popularMenu,
//                                 );
//                               },
//                             ),
//                           );
//                         });
//                       },
//                     );
//                   },
//                 );
//               } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                 return const Center(child: Text('No menu available.'));
//               }
//               return const Center(child: CircularProgressIndicator());
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
