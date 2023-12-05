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

class MenuComment {
  String comment;
  int menuId;

  MenuComment({
    required this.comment,
    required this.menuId,
  });
  Map<String, dynamic> toJson() => {
    "comment":comment,
        "menuId": menuId,
      };
}
