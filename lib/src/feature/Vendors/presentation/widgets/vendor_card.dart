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
      Exception(e);
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

  List<IconData> getStarIcons() {
    int rating = (widget.restaurant?.rating ?? 0) ~/ 2; // Assuming rating is out of 10

    List<IconData> stars = List.generate(
      5,
      (index) => index < rating
          ? Icons.star
          : (index == rating && rating % 2 == 1)
              ? Icons.star_half
              : Icons.star_border,
    );

    return stars;
  }

  @override
  Widget build(BuildContext context) {
    List<IconData> starIcons = getStarIcons();

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
            width: MediaQuery.of(context).size.width * .02,
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
                      widget.restaurant?.name ?? '',
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    Text(widget.restaurant?.location ?? ''),
                    Row(
                      children: [
                        for (var starIcon in starIcons)
                          Icon(
                            starIcon,
                            color: starIcon == Icons.star ? orange : grey,
                            size: 20,
                          ),
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
