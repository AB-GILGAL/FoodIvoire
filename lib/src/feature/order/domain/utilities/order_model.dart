import 'dart:math';

class OrderModel {
  final String orderNumber;
  final double amount;
  final List items;

  OrderModel({
    required this.orderNumber,
    required this.amount,
    required this.items,
  });
  Map toJson() => {
        'orderNumber': orderNumber,
        'amount': amount,
        'items': items,
      };
}


String generateRandomId() {
  final random = Random();
  // Generate a list of 12 random numbers between 0 and 9
  final idList = List.generate(12, (index) => random.nextInt(10));
  // Convert the list to a string
  final id = idList.join('');
  return id;
}