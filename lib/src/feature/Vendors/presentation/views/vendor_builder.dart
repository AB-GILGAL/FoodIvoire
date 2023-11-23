import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/Vendors/domain/entities/vendor_model.dart';
import 'package:foodivoire/src/feature/Vendors/presentation/provider/vendor_provider.dart';
import 'package:foodivoire/src/feature/Vendors/presentation/views/vendor_detail.dart';
import 'package:foodivoire/src/shared/constant/colors.dart';
import 'package:foodivoire/src/shared/utils/show.snacbar.dart';
import 'package:provider/provider.dart';

import '../widgets/vendor_card.dart';

class RestaurantBuilder extends StatefulWidget {
  const RestaurantBuilder({super.key});

  @override
  State<RestaurantBuilder> createState() => _RestaurantBuilderState();
}

class _RestaurantBuilderState extends State<RestaurantBuilder> {

Future<List<RestaurantDataModel>>? restaurants;
  fetchRestaurants() async {
    final result =
        await context.read<RestaurantProvider>().fetchRestaurants();

    result
        .fold((failure) => showCustomSnackBar(context, failure.message, orange),
            (success) {
      if (mounted) {
        setState(() {
          restaurants = Future.value(success);
        });
      }
    });
  }

  @override
  void initState() {
    fetchRestaurants();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: restaurants, builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final restaurants =  snapshot.data!;
                return     ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.03,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: restaurants.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  // final restaurant = popularRestaurants[index];
                  // final img = restaurant["image"];
                  // final name = restaurant["name"];
                  // final distance = restaurant["distance"];
                  
                  var restaurant =restaurants[index];

                  return PopularRestaurants(
                      restaurant: restaurant,
                      index: index,
                      isSelectedIndex:null ,
                      onTap: () {
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return  RestaurantDetailView(restaurant:restaurant);
                            },
                          ));
                      });
                      });
                });
      }   else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No vendor available.'));
          }
          return const Center(child: CircularProgressIndicator());
          
      },);
  }
}