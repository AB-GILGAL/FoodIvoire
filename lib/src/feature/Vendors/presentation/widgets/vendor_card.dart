import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/Vendors/domain/entities/vendor_model.dart';
import 'package:foodivoire/src/feature/menu/domain/entities/menu_model.dart';
import 'package:foodivoire/src/shared/constant/colors.dart';
import 'package:geolocator/geolocator.dart';

class PopularRestaurants extends StatefulWidget {
  const PopularRestaurants(
      {super.key,
      this.distance,
      this.image,
      this.name,
      this.index,
      this.isSelectedIndex,
     this.restaurant,
     this.menu,

      this.onTap});

  final RestaurantDataModel? restaurant;
  final MenuDataModel? menu;
  final String? name;
  final String? image;
  final int? distance;
  final int? index;
  final int? isSelectedIndex;
  final void Function()? onTap;

  @override
  State<PopularRestaurants> createState() => _PopularRestaurantsState();
}

class _PopularRestaurantsState extends State<PopularRestaurants> {

double distance = 0.0;
  Position? userLocation; // Store the user's location here
  double restaurantLatitude = 0.0;
  double restaurantLongitude = 0.0;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        userLocation = position;
        // Initialize restaurantLatitude and restaurantLongitude here
        restaurantLatitude = widget.restaurant!.latitude;
        restaurantLongitude = widget.restaurant!.longitude;
        _calculateDistance();
      });
    } catch (e) {
      print(e);
    }
  }

  void _calculateDistance() {
    if (userLocation != null) {
      double distanceInMeters = Geolocator.distanceBetween(
        userLocation!.latitude,
        userLocation!.longitude,
        restaurantLatitude,
        restaurantLongitude,
      );
      double distanceInKm = distanceInMeters / 1000;
      setState(() {
        distance = distanceInKm;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Row(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * .09,
            width: MediaQuery.sizeOf(context).width * .23,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image:
                  DecorationImage(image: NetworkImage(widget.restaurant!.banner), fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * .02,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.restaurant!.name,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .01,
                    ),
                    Text(widget.restaurant!.location),
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
                 Row(
                  children: [
                    const Icon(Icons.place_outlined),
                    if (userLocation != null)
                    Text('${distance.toStringAsFixed(2)} km'),
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