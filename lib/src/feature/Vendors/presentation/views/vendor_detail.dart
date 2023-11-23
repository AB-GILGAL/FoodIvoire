import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/Vendors/presentation/views/vendor_builder.dart';
import 'package:foodivoire/src/feature/menu/presentation/views/menu_detail.dart';
import 'package:foodivoire/src/feature/Vendors/domain/entities/vendor_model.dart';
import 'package:foodivoire/src/feature/language/presentation/provider/lang_provider.dart';
import 'package:foodivoire/src/shared/constant/colors.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class RestaurantDetailView extends StatefulWidget {
  const RestaurantDetailView({super.key, this.restaurant});
  // final String? image;
  // final String? name;
  // final String? description
  final RestaurantDataModel? restaurant;
  @override
  State<RestaurantDetailView> createState() => _RestaurantDetailViewState();
}

class _RestaurantDetailViewState extends State<RestaurantDetailView> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * .6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(widget.restaurant!.banner),
                  fit: BoxFit.cover),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .04,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const CircleAvatar(
                          backgroundColor: Colors.black45,
                          child: Center(
                              child: Icon(
                            Icons.arrow_back_ios,
                            color: white,
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .12,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Material(
                        color: Colors.white60,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            languageProvider.isEnglish ? "OPEN" : "OUVERT",
                            style: const TextStyle(
                                color: green, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .02,
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * .703,
                decoration: const BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(30),
                    left: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.restaurant!.name,
                              style: Theme.of(context).textTheme.headlineLarge),
                          const Row(
                            children: [
                              Icon(
                                Icons.star_border_outlined,
                                color: orange,
                                size: 20,
                              ),
                              Icon(
                                Icons.star_border_outlined,
                                color: orange,
                                size: 20,
                              ),
                              Icon(
                                Icons.star_border_outlined,
                                color: orange,
                                size: 20,
                              ),
                              Icon(
                                Icons.star_border_outlined,
                                color: grey,
                                size: 20,
                              ),
                              Icon(
                                Icons.star_border_outlined,
                                color: grey,
                                size: 20,
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .01,
                      ),
                      DefaultTabController(
                          length: 2,
                          initialIndex: 0,
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.sizeOf(context).height * .03,
                                child: TabBar(
                                    labelStyle: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(fontSize: 15),
                                    labelColor: green,
                                    unselectedLabelColor: grey,
                                    indicatorColor: green,
                                    indicatorSize: TabBarIndicatorSize.label,
                                    tabs: [
                                      const Tab(
                                        text: "DETAILS",
                                      ),
                                      Tab(
                                        text: languageProvider.isEnglish
                                            ? 'COMMENT'
                                            : "COMMENTAIRE",
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                height: MediaQuery.sizeOf(context).height * .57,
                                child: TabBarView(children: [
                                  SingleChildScrollView(
                                    controller: ScrollController(),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              .01,
                                        ),
                                        ReadMoreText(
                                          widget.restaurant!.description,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          trimLines: 4,
                                          textAlign: TextAlign.justify,
                                          trimMode: TrimMode.Line,
                                          trimCollapsedText: "Read more",
                                          trimExpandedText: "Show less",
                                          lessStyle: const TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold),
                                          moreStyle: const TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              .03,
                                        ),
                                        ListView.separated(
                                            separatorBuilder: (context,
                                                    index) =>
                                                SizedBox(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.03,
                                                ),
                                            shrinkWrap: true,
                                            itemCount:
                                                widget.restaurant!.menu.length,
                                            scrollDirection: Axis.vertical,
                                            itemBuilder: (context, index) {
                                              final food = widget
                                                  .restaurant!.menu[index];
                                              final img = food.banner;
                                              final name = food.name;
                                              final origin = food.origin;
                                              final price = food.price;

                                              return PopularFoods(
                                                  image: img,
                                                  name: name,
                                                  origin: origin,
                                                  price: price,
                                                  index: index,
                                                  isSelectedIndex: isSelected,
                                                  onTap: () {
                                                    setState(() {
                                                      isSelected = index;
                                                      Navigator.push(context,
                                                          MaterialPageRoute(
                                                        builder: (context) {
                                                          return MenuDetailView(
                                                            food: food,
                                                          );
                                                        },
                                                      ));
                                                    });
                                                  });
                                            }),
                                      ],
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    child: Stack(
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  .02,
                                            ),
                                            const Comments(),
                                            SizedBox(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  .03,
                                            ),
                                            const Comments(),
                                            SizedBox(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  .04,
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                languageProvider.isEnglish ? "Others" : "Autres",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineMedium!
                                                    .copyWith(
                                                        color: green, fontSize: 18),
                                              ),
                                            ),
                                            const RestaurantBuilder()
                                          ],
                                        ),
                                        SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextField(
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
                                      ],
                                    ),
                                  )
                                ]),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Comments extends StatelessWidget {
  const Comments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage(
                    "assets/images/ab.png",
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .08,
                ),
                Text(
                  "Siaka",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 17),
                )
              ],
            ),
            const Text(
              "02/11/2023",
              style: TextStyle(
                  color: grey, fontSize: 15, fontWeight: FontWeight.w700),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .02,
        ),
        const Text(
            "Un régal, accueil parfait, service excellent. Tous les plats que nous avons goûté étaient délicieux. La déco et l'ambiance du restaurant très sympathique."),
      ],
    );
  }
}
