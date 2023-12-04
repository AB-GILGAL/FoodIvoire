class Rating {
  int scale;
  int restaurantId;

  Rating({
    required this.scale,
    required this.restaurantId,
  });
  Map<dynamic, dynamic> toJson() => {
    "scale":scale,
        "restaurantId": restaurantId,
      };
}
