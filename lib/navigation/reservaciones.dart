
import 'package:flutter/material.dart';

class Reservaciones extends StatelessWidget {
  const Reservaciones({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservaciones'),
      ),
      body: const Center(
        child: Text('Reservaciones'),
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context,'/reservaciones'),
      backgroundColor: Colors.pink,
      foregroundColor: Colors.white,
      child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );

  }
}


