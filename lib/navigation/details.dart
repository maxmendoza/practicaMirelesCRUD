import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Detail extends StatelessWidget {
  final List<String> images;
  final String name;
  final String description;
  final double rating;

  const Detail({
    super.key,
    required this.images,
    required this.name,
    required this.description,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(height: 200.0, autoPlay: true),
              items: images.map((imgUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.network(imgUrl,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width);
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                    );
                  }),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
