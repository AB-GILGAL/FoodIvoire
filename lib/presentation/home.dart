import 'package:flutter/material.dart';
import 'package:foodivoire/presentation/food_detail.dart';
import 'package:foodivoire/presentation/vendor_detail.dart';
import 'package:foodivoire/shared/utils/colors.dart';
import 'package:foodivoire/shared/utils/images.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int isSelected = 0;
  int isSelected1 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
          backgroundColor: white,
          elevation: 0,
          leading: const Icon(
            Icons.menu,
            color: black,
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.search,
                  color: black,
                  size: 30,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .7,
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: orange)),
                        fillColor: grey,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: orange)),
                        isDense: true),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .06,
                  child: Image.asset(CustomeImages.filter),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            const Text(
              "vivez une expeience gastronomique inoubliable en côte D’ivoire",
              textAlign: TextAlign.center,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Nouriture populaire",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Tout",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),

            SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.28,
                child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.05,
                        ),
                    shrinkWrap: true,
                    itemCount: foodItems.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final food = foodItems[index];
                      final img = food["image"];
                      final name = food["name"];
                      final origin = food["origin"];
                      final reviews = food["reviews"];
                      return FoodCard(
                          image: img,
                          name: name,
                          origin: origin,
                          reviews: reviews,
                          index: index,
                          isSelectedIndex: isSelected,
                          onTap: () {
                            setState(() {
                              isSelected = index;
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const FoodDetailView();
                          },));
                            });
                          });
                    })),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Suggestion",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Tout",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.28,
                child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.05,
                        ),
                    shrinkWrap: true,
                    itemCount: foodItems.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final food = foodItems[index];
                      final img = food["image"];
                      final name = food["name"];
                      final origin = food["origin"];
                      final reviews = food["reviews"];
                      return FoodCard(
                          image: img,
                          name: name,
                          origin: origin,
                          reviews: reviews,
                          index: index,
                          isSelectedIndex: isSelected,
                          onTap: () {
                            setState(() {
                              isSelected = index;
                            });
                          });
                    })),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vendeurs populaires",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Tout",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.03,
                    ),
                shrinkWrap: true,
                itemCount: popularVendors.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final vendor = popularVendors[index];
                  final img = vendor["image"];
                  final name = vendor["name"];
                  final distance = vendor["distance"];

                  return PopularVendors(
                      image: img,
                      name: name,
                      distance: distance,
                      index: index,
                      isSelectedIndex: isSelected1,
                      onTap: () {
                        setState(() {
                          isSelected1 = index;
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return VendorDetailView();
                          },));
                        });
                      });
                }),
          ],
        ),
      ),
    );
  }
}

class PopularVendors extends StatelessWidget {
  const PopularVendors(
      {super.key,
      this.distance,
      this.image,
      this.index,
      this.isSelectedIndex,
      this.name,
      this.onTap});

  final String? image;
  final String? name;
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
                Row(
                  children: [
                    const Icon(Icons.place_outlined),
                    Text("$distance km"),
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

class FoodCard extends StatelessWidget {
  const FoodCard(
      {super.key,
      this.image,
      this.name,
      this.index,
      this.isSelectedIndex,
      this.onTap,
      this.origin,
      this.reviews});
  final String? image;
  final String? name;
  final String? origin;
  final int? reviews;
  final int? index;
  final int? isSelectedIndex;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
          width: MediaQuery.sizeOf(context).width * 0.7,
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
                        image: AssetImage(image!), fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .012,
                ),
                Text(
                  name!,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .012,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      origin!,
                      style: const TextStyle(color: orange),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.message,
                          size: 15,
                        ),
                        Text(
                          reviews.toString(),
                          style: const TextStyle(fontWeight: FontWeight.w700),
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
    "image": CustomeImages.fd,
    "name": "Placali sauce Kopè",
    "origin": "Ivoirien",
    "reviews": 100
  },
  {
    "image": CustomeImages.fd1,
    "name": "Aloco poulet",
    "origin": "Ivoirien",
    "reviews": 120
  },
  {
    "image": CustomeImages.foodivuah,
    "name": "Foutou sauce Graine",
    "origin": "Ivoirien",
    "reviews": 90
  }
];

List<Map<String, dynamic>> popularVendors = [
  {"image": CustomeImages.fd2, "name": "Miss Zahui", "distance": 5},
  {"image": CustomeImages.fd3, "name": "I-Garba", "distance": 12},
  {"image": CustomeImages.fd, "name": "Foutou Graine", "distance": 10}
];
