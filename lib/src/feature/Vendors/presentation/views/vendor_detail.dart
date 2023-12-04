import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/Vendors/presentation/views/vendor_builder.dart';
import 'package:foodivoire/src/feature/comments/presentation/comment_textfield.dart';
import 'package:foodivoire/src/feature/comments/presentation/view/comment_builder.dart';
import 'package:foodivoire/src/feature/menu/presentation/views/menu_detail.dart';
import 'package:foodivoire/src/feature/Vendors/domain/entities/vendor_model.dart';
import 'package:foodivoire/src/feature/language/presentation/provider/lang_provider.dart';
import 'package:foodivoire/src/feature/rating/presentation/provider/rating_provider.dart';
import 'package:foodivoire/src/shared/constant/colors.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class RestaurantDetailView extends StatefulWidget {
  const RestaurantDetailView({Key? key, this.restaurant}) : super(key: key);
  final RestaurantDataModel? restaurant;
  

  @override
  State<RestaurantDetailView> createState() => _RestaurantDetailViewState();
}

class _RestaurantDetailViewState extends State<RestaurantDetailView> {
  int selectedStarIndex = 0;

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(widget.restaurant?.banner ?? ''),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
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
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.12,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Material(
                          color: Colors.white60,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              languageProvider.isEnglish ? "OPEN" : "OUVERT",
                              style: const TextStyle(
                                color: green,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.703,
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
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.restaurant!.name,
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            Row(
                              children: List.generate(
                                5,
                                (index) => InkWell(
                                  onTap: ()async {
                                    await context
                                .read<RatingProvider>()
                                .customerRating(
                                  index+1,
                                  widget.restaurant!.id
                                )
                                .then((value) => value.fold(
                                      (l) => print(l.message),
                                      (r) => print(r),
                                    ));
                                    setState((){
                                      selectedStarIndex = index;
                                      
                                    });
                                  },
                                  child: Icon(
                                    Icons.star_border_outlined,
                                    color: index <= selectedStarIndex
                                        ? orange
                                        : grey,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        DefaultTabController(
                          length: 2,
                          initialIndex: 0,
                          child: Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                                child: TabBar(
                                  onTap: (value) {
                                    // setState(() {
                                    //   selectedStarIndex = value;
                                    // });
                                  },
                                  labelStyle: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(fontSize: 15),
                                  labelColor: green,
                                  unselectedLabelColor: grey,
                                  indicatorColor: green,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  tabs: const [
                                    Tab(
                                      text: "DETAILS",
                                    ),
                                    Tab(
                                      text: "COMMENT",
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.57,
                                child: TabBarView(
                                  children: [
                                    SingleChildScrollView(
                                      controller: ScrollController(),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height:
                                                MediaQuery.of(context).size.height *
                                                    0.01,
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
                                              fontWeight: FontWeight.bold,
                                            ),
                                            moreStyle: const TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                MediaQuery.of(context).size.height *
                                                    0.03,
                                          ),
                                          ListView.separated(
                                            separatorBuilder:
                                                (context, index) => SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.03,
                                            ),
                                            shrinkWrap: true,
                                            itemCount: widget.restaurant!.menu!.length,
                                            scrollDirection: Axis.vertical,
                                            itemBuilder: (context, index) {
                                              final food = widget.restaurant!.menu![index];
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
                                                isSelectedIndex: selectedStarIndex,
                                                onTap: () {
                                                  setState(() {
                                                    selectedStarIndex = index;
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) {
                                                          return MenuDetailView(
                                                            food: food,
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  });
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                     Stack(
                                      children: [
                                        SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        .02,
                                              ),
                                               CommentBuilder(restaurant: widget.restaurant,),
                                              SizedBox(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        .04,
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  languageProvider.isEnglish
                                                      ? "Others"
                                                      : "Autres",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineMedium!
                                                      .copyWith(
                                                          color: green,
                                                          fontSize: 18),
                                                ),
                                              ),
                                              const RestaurantBuilder()
                                            ],
                                          ),
                                        ),
                                        CommentTextField(restaurant: widget.restaurant),
                                      ],
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
          ),
        ],
      ),
    );
  }
}