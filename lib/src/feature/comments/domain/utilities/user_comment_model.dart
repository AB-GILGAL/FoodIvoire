class Comment {
  String comment;
  int restaurantId;

  Comment({
    required this.comment,
    required this.restaurantId,
  });
  Map<String, dynamic> toJson() => {
    "comment":comment,
        "restaurantId": restaurantId,
      };
}
