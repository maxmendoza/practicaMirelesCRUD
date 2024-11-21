import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:learning/moduls/restaurants/entities/restaurant.dart';

class CustomListRestaurants extends StatelessWidget {
  const CustomListRestaurants({
    super.key,
    required this.restaurants,
  });

  final Restaurant restaurants;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          restaurants.images[0],
          width: 60,
          height: 60,
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(restaurants.name),
            SizedBox(
                width: 200, height: 100, child: Text(restaurants.description)),
          ],
        ),
        const Spacer(),
        StarRating(
          rating: restaurants.rating / restaurants.count,
          color: Colors.orange[200],
          borderColor: Colors.grey,
          starCount: 5,
          size: 12,
        ),
      ],
    );
  }
}
