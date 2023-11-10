import 'package:flutter/material.dart';
import 'package:foodivoire/presentation/home.dart';
import 'package:foodivoire/presentation/order.dart';
import 'package:foodivoire/presentation/vendor_detail.dart';
import 'package:foodivoire/src/shared/constant/colors.dart';
import 'package:foodivoire/src/shared/utils/images.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../src/feature/language/presentation/provider/lang_provider.dart';

class FoodDetailView extends StatefulWidget {
  const FoodDetailView({super.key});
  // final String? image;
  // final String? name;
  // final String? description

  @override
  State<FoodDetailView> createState() => _FoodDetailViewState();
}

class _FoodDetailViewState extends State<FoodDetailView> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * .4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(CustomImages.fd1), fit: BoxFit.cover),
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
                          child: Center(child: Icon(Icons.arrow_back_ios, color: white,)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .16,
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
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Aloco poulet",
                              style: Theme.of(context).textTheme.headlineLarge),
                          const Row(
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
                                          "Le plat de poulet avec aloco est une combinaison savoureuse de morceaux de poulet grillé ou rôti accompagnés de tranches de bananes plantains frites.",
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
                                              .02,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return const OrderView();
                                                },
                                              ));
                                            },
                                            child: Text(
                                                languageProvider.isEnglish
                                                    ? 'ORDER'
                                                    : "SAVOIR",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineMedium!
                                                    .copyWith(color: green, fontSize: 18)),
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
                                            itemCount: popularVendors.length,
                                            scrollDirection: Axis.vertical,
                                            itemBuilder: (context, index) {
                                              final vendor =
                                                  popularVendors[index];
                                              final img = vendor["image"];
                                              final name = vendor["name"];
                                              final distance =
                                                  vendor["distance"];

                                              return PopularVendors(
                                                  image: img,
                                                  name: name,
                                                  distance: distance,
                                                  index: index,
                                                  isSelectedIndex: isSelected,
                                                  onTap: () {
                                                    setState(() {
                                                      isSelected = index;
                                                      Navigator.push(context,
                                                          MaterialPageRoute(
                                                        builder: (context) {
                                                          return const VendorDetailView();
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

class PopularFoods extends StatelessWidget {
  const PopularFoods(
      {super.key,
      this.image,
      this.index,
      this.isSelectedIndex,
      this.name,
      this.onTap});

  final String? image;
  final String? name;
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
                  DecorationImage(image: AssetImage(image!), fit: BoxFit.cover),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name!,
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
