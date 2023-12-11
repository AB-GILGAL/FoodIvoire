// import 'package:flutter/material.dart';
// import 'package:foodivoire/presentation/drawer.dart';
// import 'package:foodivoire/src/feature/menu/domain/entities/menu_model.dart';
// import 'package:foodivoire/src/feature/Vendors/presentation/views/vendor_builder.dart';
// import 'package:foodivoire/src/feature/menu/presentation/views/popular_menu_builder.dart';
// import 'package:foodivoire/src/feature/menu/presentation/views/suggested_menu_builder.dart';
// import 'package:foodivoire/src/shared/constant/colors.dart';
// import 'package:foodivoire/src/shared/utils/images.dart';
// import 'package:provider/provider.dart';

// import '../src/feature/language/presentation/provider/lang_provider.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   int isSelected = 0;
//   int isSelected1 = 0;

//   @override
//   Widget build(BuildContext context) {
//     final languageProvider = Provider.of<LanguageProvider>(context);
//     return Scaffold(
//       backgroundColor: white,
//       appBar: AppBar(
//         foregroundColor: black,
//         backgroundColor: white,
//         elevation: 0,
//       ),
//       drawer: const DrawerView(),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: ListView(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Icon(
//                   Icons.search,
//                   color: Colors.black,
//                   size: 30,
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * .05,
//                   width: MediaQuery.of(context).size.width * 0.7,
//                   child: TextField(
//                     cursorHeight: 20,
//                     cursorColor: green,
//                     style: const TextStyle(fontSize: 15),
//                     decoration: InputDecoration(
//                         contentPadding:
//                             const EdgeInsets.all(8.0).copyWith(left: 15),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: const BorderSide(color: orange),
//                         ),
//                         fillColor: lightGrey,
//                         filled: true,
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: const BorderSide(color: orange),
//                         ),
//                         // isDense: true,
//                         isCollapsed: true),
//                   ),
//                 ),
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.06,
//                   child: Image.asset(CustomImages.filter),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: MediaQuery.sizeOf(context).height * .02,
//             ),
//             Text(
//               languageProvider.isEnglish
//                   ? "Enjoy an unforgettable gastronomic experience in côte D'ivoire"
//                   : "vivez une expeience gastronomique inoubliable en côte D’ivoire",
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(
//               height: MediaQuery.sizeOf(context).height * .02,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                     languageProvider.isEnglish
//                         ? "Popular food"
//                         : "Nouriture populaire",
//                     style: Theme.of(context).textTheme.headlineMedium),
//                 Text(languageProvider.isEnglish ? "All" : "Tout",
//                     style: Theme.of(context)
//                         .textTheme
//                         .headlineSmall!
//                         .copyWith(fontWeight: FontWeight.bold))
//               ],
//             ),
//             SizedBox(
//                 height: MediaQuery.sizeOf(context).height * 0.29,
//                 child: const PopularMenuBuilder()),
//             SizedBox(
//               height: MediaQuery.sizeOf(context).height * .02,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("Suggestion",
//                     style: Theme.of(context).textTheme.headlineMedium),
//                 Text(languageProvider.isEnglish ? 'All' : "Tout",
//                     style: Theme.of(context)
//                         .textTheme
//                         .headlineSmall!
//                         .copyWith(fontWeight: FontWeight.bold))
//               ],
//             ),
//             SizedBox(
//                 height: MediaQuery.sizeOf(context).height * 0.29,
//                 child: const SuggestedMenuBuilder()),
//             SizedBox(
//               height: MediaQuery.sizeOf(context).height * .02,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                     languageProvider.isEnglish
//                         ? 'Popular Restaurants'
//                         : "Vendeurs Populaires",
//                     style: Theme.of(context).textTheme.headlineMedium),
//                 Text(languageProvider.isEnglish ? 'All' : "Tout",
//                     style: Theme.of(context)
//                         .textTheme
//                         .headlineSmall!
//                         .copyWith(fontWeight: FontWeight.bold))
//               ],
//             ),
//             SizedBox(
//               height: MediaQuery.sizeOf(context).height * .02,
//             ),
//             const RestaurantBuilder()
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:foodivoire/presentation/drawer.dart';
import 'package:foodivoire/src/feature/Vendors/presentation/views/vendor_builder.dart';
import 'package:foodivoire/src/feature/menu/presentation/provider/popular_menu_provider.dart';
import 'package:foodivoire/src/feature/menu/presentation/provider/suggested_menu_provider.dart';
import 'package:foodivoire/src/feature/menu/presentation/views/menu_detail.dart';
import 'package:foodivoire/src/shared/utils/show.snacbar.dart';
import 'package:provider/provider.dart';
import 'package:foodivoire/src/feature/language/presentation/provider/lang_provider.dart';
import 'package:foodivoire/src/feature/menu/domain/entities/menu_model.dart';
import 'package:foodivoire/src/shared/constant/colors.dart';
import 'package:foodivoire/src/shared/utils/images.dart';
import 'package:foodivoire/src/feature/menu/presentation/views/popular_menu_builder.dart';
import 'package:foodivoire/src/feature/menu/presentation/views/suggested_menu_builder.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
//   int isSelected = 0;
//   int isSelected1 = 0;
//   final TextEditingController _searchController = TextEditingController();
//   List<Map<String, dynamic>> filteredFoodItems = List.from(foodItems);

//   void filterFoodItems(String query) {
//     setState(() {
//       if (query.isEmpty) {
//         filteredFoodItems = List.from(foodItems);
//       } else {
//         filteredFoodItems = foodItems
//             .where((food) =>
//                 food['name'].toLowerCase().contains(query.toLowerCase()))
//             .toList();
//       }
//     });
//   }

//   // int isSelected = 0;
//   late Future<List<MenuDataModel>> popularMenus;
//   late Future<List<MenuDataModel>> suggestedMenus;
//   late List<MenuDataModel> filteredMenus = [];
//   late List<MenuDataModel> filtered1Menus = [];

//   // TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     popularMenus = fetchPopularMenus();
//     suggestedMenus = fetchSuggestedMenus();
//   }

//   Future<List<MenuDataModel>> fetchPopularMenus() async {
//     final result =
//         await context.read<PopularMenuProvider>().fetchPopularMenus();

//     return result.fold(
//       (failure) {
//         showCustomSnackBar(context, failure.message, orange);
//         return [];
//       },
//       (success) {
//         setState(() {
//           filteredMenus = success;
//         });
//         return success;
//       },
//     );
//   }

//    Future<List<MenuDataModel>> fetchSuggestedMenus() async {
//     final result =
//         await context.read<SuggestedMenuProvider>().fetchSuggestedMenus();

//     return result.fold(
//       (failure) {
//         showCustomSnackBar(context, failure.message, orange);
//         return [];
//       },
//       (success) {
//         setState(() {
//           filtered1Menus = success;
//         });
//         return success;
//       },
//     );
//   }

//   void filterMenus(String query) async {
//   List<MenuDataModel> allMenus = await popularMenus;

//   setState(() {
//     if (query.isEmpty) {
//       filteredMenus = List.from(allMenus);
//     } else {
//       filteredMenus = allMenus
//           .where((menu) => menu.name.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     }
//   });
// }

//  void filter1Menus(String query) async {
//   List<MenuDataModel> allMenus = await suggestedMenus;

//   setState(() {
//     if (query.isEmpty) {
//       filtered1Menus = List.from(allMenus);
//     } else {
//       filtered1Menus = allMenus
//           .where((menu) => menu.name.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     }
//   });
// }


int isSelected = 0;
  late Future<List<MenuDataModel>> popularMenus;
  late Future<List<MenuDataModel>> suggestedMenus;
  List<MenuDataModel> filteredMenus = [];
  List<MenuDataModel> filtered1Menus = [];
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    popularMenus = fetchPopularMenus();
    suggestedMenus = fetchSuggestedMenus();
    _searchController = TextEditingController();
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

   Future<List<MenuDataModel>> fetchSuggestedMenus() async {
    final result =
        await context.read<SuggestedMenuProvider>().fetchSuggestedMenus();

    return result.fold(
      (failure) {
        showCustomSnackBar(context, failure.message, orange);
        return [];
      },
      (success) {
        setState(() {
          filtered1Menus = success;
        });
        return success;
      },
    );
  }

  void filterMenus(String query) async {
    List<MenuDataModel> allPopularMenus = await popularMenus;
    List<MenuDataModel> allSuggestedMenus = await suggestedMenus;

    setState(() {
      if (query.isEmpty) {
        filteredMenus = List.from(allPopularMenus);
        filtered1Menus = List.from(allSuggestedMenus);
      } else {
        filteredMenus = allPopularMenus
            .where((menu) => menu.name.toLowerCase().contains(query.toLowerCase()))
            .toList();

        filtered1Menus = allSuggestedMenus
            .where((menu) => menu.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        foregroundColor: black,
        backgroundColor: white,
        elevation: 0,
      ),
      drawer: const DrawerView(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30,
                ),
            
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
              width: MediaQuery.of(context).size.width * 0.7,
              child: TextField(
                controller: _searchController,
                onChanged: (query) => filterMenus(query),
                cursorHeight: 20,
                cursorColor: green,
                style: const TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    contentPadding:
                            const EdgeInsets.all(8.0).copyWith(left: 15),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: orange),
                        ),
                        fillColor: lightGrey,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: orange),
                        ),
                        // isDense: true,
                        isCollapsed: true),
                  ),
                    ),
             SizedBox(
                  width: MediaQuery.of(context).size.width * 0.06,
                  child: Image.asset(CustomImages.filter),
                ),
              ],
            ),

            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    languageProvider.isEnglish
                        ? "Popular food"
                        : "Nouriture populaire",
                    style: Theme.of(context).textTheme.headlineMedium),
                Text(
                  languageProvider.isEnglish ? "All" : "Tout",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.29,
              child:Column(
      children: [
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
    ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Suggestion",
                    style: Theme.of(context).textTheme.headlineMedium),
                Text(
                  languageProvider.isEnglish ? 'All' : "Tout",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.29,
              child: Column(
      children: [
        Expanded(
          child: FutureBuilder<List<MenuDataModel>>(
            future: suggestedMenus,
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
                  itemCount: filtered1Menus.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var suggestedMenu = filtered1Menus[index];

                    return FoodCard1(
                      suggestedMenus: suggestedMenu,
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
                                  menu: suggestedMenu,
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
    ),
            ),
             SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    languageProvider.isEnglish
                        ? 'Popular Restaurants'
                        : "Vendeurs Populaires",
                    style: Theme.of(context).textTheme.headlineMedium),
                Text(languageProvider.isEnglish ? 'All' : "Tout",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold))
              ],
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            const RestaurantBuilder()
          ],
        ),
          
      ),
    
    );
  }
}

// ... existing code

class FoodCard extends StatefulWidget {
  const FoodCard(
      {super.key,
      this.image,
      this.name,
      this.index,
      this.isSelectedIndex,
      this.onTap,
      this.origin,
      this.reviews,
      this.popularMenus,
      this.suggestedMenus});
  final MenuDataModel? popularMenus;
  final MenuDataModel? suggestedMenus;
  final String? image;
  final String? name;
  final String? origin;
  final int? reviews;
  final int? index;
  final int? isSelectedIndex;
  final void Function()? onTap;

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15).copyWith(left: 2),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: white,
              boxShadow: [
                BoxShadow(
                    color: grey.withOpacity(0.4),
                    offset: const Offset(0, 0),
                    blurRadius: 2,
                    spreadRadius: 2)
              ]),
          width: MediaQuery.sizeOf(context).width * 0.55,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * .15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(widget.popularMenus?.banner ?? ''),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .01,
                ),
                Text(
                  widget.popularMenus?.name ?? '',
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .012,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.popularMenus?.origin ?? '',
                      style: const TextStyle(color: orange),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.favorite_border_outlined,
                          size: 15,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * .01,
                        ),
                        Text(
                          widget.popularMenus?.like.toString() ?? '',
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FoodCard1 extends StatefulWidget {
  const FoodCard1(
      {super.key,
      this.image,
      this.name,
      this.index,
      this.isSelectedIndex,
      this.onTap,
      this.origin,
      this.reviews,
      this.popularMenus,
      this.suggestedMenus});
  final MenuDataModel? popularMenus;
  final MenuDataModel? suggestedMenus;
  final String? image;
  final String? name;
  final String? origin;
  final int? reviews;
  final int? index;
  final int? isSelectedIndex;
  final void Function()? onTap;

  @override
  State<FoodCard1> createState() => _FoodCard1State();
}

class _FoodCard1State extends State<FoodCard1> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15).copyWith(left: 2),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: white,
              boxShadow: [
                BoxShadow(
                    color: grey.withOpacity(0.4),
                    offset: const Offset(0, 0),
                    blurRadius: 2,
                    spreadRadius: 2)
              ]),
          width: MediaQuery.sizeOf(context).width * 0.55,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * .15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image:
                            NetworkImage(widget.suggestedMenus?.banner ?? ''),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .01,
                ),
                Text(
                  widget.suggestedMenus?.name ?? '',
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .012,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.suggestedMenus?.origin ?? '',
                      style: const TextStyle(color: orange),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.favorite_border_outlined,
                          size: 15,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * .01,
                        ),
                        Text(
                          widget.suggestedMenus?.like.toString() ?? '',
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> foodItems = [
  {
    "image": CustomImages.fd,
    "name": "Placali sauce Kopè",
    "origin": "Ivoirien",
    "reviews": 100
  },
  {
    "image": CustomImages.fd1,
    "name": "Aloco poulet",
    "origin": "Ivoirien",
    "reviews": 120
  },
  {
    "image": CustomImages.foodivuah,
    "name": "Foutou sauce Graine",
    "origin": "Ivoirien",
    "reviews": 90
  }
];

List<Map<String, dynamic>> popularVendors = [
  {"image": CustomImages.fd2, "name": "Miss Zahui", "distance": 5},
  {"image": CustomImages.fd3, "name": "I-Garba", "distance": 12},
  {"image": CustomImages.fd, "name": "Foutou Graine", "distance": 10}
];
