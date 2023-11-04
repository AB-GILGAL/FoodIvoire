import 'package:flutter/material.dart';
import 'package:foodivoire/presentation/food_detail.dart';
import 'package:foodivoire/presentation/home.dart';
import 'package:foodivoire/src/feature/language/presentation/provider/lang_provider.dart';
import 'package:foodivoire/src/shared/constant/colors.dart';
import 'package:foodivoire/src/shared/utils/images.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class VendorDetailView extends StatefulWidget {
  const VendorDetailView({super.key});
  // final String? image;
  // final String? name;
  // final String? description

  @override
  State<VendorDetailView> createState() => _VendorDetailViewState();
}

class _VendorDetailViewState extends State<VendorDetailView> {
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
                  image: AssetImage(CustomImages.vndr), fit: BoxFit.cover),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.black45,
                            child: Center(child: Icon(Icons.arrow_back_ios)),
                          ),
                        ),
                        const CircleAvatar(
                          backgroundColor: Colors.black45,
                          child: Center(child: Icon(Icons.share)),
                        ),
                      ],
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
                height: MediaQuery.sizeOf(context).height * .04,
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
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .05,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Miss Zahui",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 24),
                          ),
                          Row(
                            children: [
                              Icon(Icons.favorite_outline),
                              Text("100")
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
                                        const Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: ReadMoreText(
                                            "Resraurant specialise dans la nourriture africaine, Chez Miss Zahoui vous pourrez toujours deguster les meilleurs plats d'attieke poisson au monde. Du sosso au loss en passant par les carpes, nous vous offrons un large choix de poissons frais.",
                                            trimLines: 4,
                                            textAlign: TextAlign.justify,
                                            trimMode: TrimMode.Line,
                                            trimCollapsedText: "Read more",
                                            trimExpandedText: "Show less",
                                            lessStyle: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                            moreStyle: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              .04,
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
                                            itemCount: foodItems.length,
                                            scrollDirection: Axis.vertical,
                                            itemBuilder: (context, index) {
                                              final food = foodItems[index];
                                              final img = food["image"];
                                              final name = food["name"];

                                              return PopularFoods(
                                                  image: img,
                                                  name: name,
                                                  index: index,
                                                  isSelectedIndex: isSelected,
                                                  onTap: () {
                                                    setState(() {
                                                      isSelected = index;
                                                      Navigator.push(context,
                                                          MaterialPageRoute(
                                                        builder: (context) {
                                                          return const FoodDetailView();
                                                        },
                                                      ));
                                                    });
                                                  });
                                            }),
                                      ],
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const Comments(),
                                        const Comments(),
                                        SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              .04,
                                        ),
                                        const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Autres",
                                            style: TextStyle(
                                                color: green,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
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
                                            itemCount: foodItems.length,
                                            scrollDirection: Axis.vertical,
                                            itemBuilder: (context, index) {
                                              final food = foodItems[index];
                                              final img = food["image"];
                                              final name = food["name"];

                                              return PopularFoods(
                                                  image: img,
                                                  name: name,
                                                  index: index,
                                                  isSelectedIndex: isSelected,
                                                  onTap: () {
                                                    setState(() {
                                                      isSelected = index;
                                                      Navigator.push(context,
                                                          MaterialPageRoute(
                                                        builder: (context) {
                                                          return const FoodDetailView();
                                                        },
                                                      ));
                                                    });
                                                  });
                                            }),
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
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(
                "assets/images/ab.png",
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .1,
            ),
            const Text(
              "Siaka",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .01,
        ),
        Row(
          children: [
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
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .04,
            ),
            const Text(
              "02/11/2023",
              style: TextStyle(
                  color: grey, fontSize: 17, fontWeight: FontWeight.w700),
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
