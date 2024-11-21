
import 'package:flutter/material.dart';

class Top extends StatelessWidget {
  const Top({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top 5'),
      ),
      body: const Center(
        child: Text('Top 5'),
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context,'/reservations'),
      backgroundColor: Colors.pink,
      foregroundColor: Colors.white,
      child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );

  }
}


