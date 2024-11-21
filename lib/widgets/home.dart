import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learning/widgets/content_column.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final db = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
    (() async => {
          await db.collection("restaurants").get().then((event) {
            for (var doc in event.docs) {
              print("${doc.id} => ${doc.data()}");
            }
          })
        })();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            ContentColumn(
              title: 'Primera columna',
              text: 'Primer parrafo',
            ),
            ContentColumn(
              title: 'Segunda columna',
              text: 'Segunda parrafo',
            ),
            ContentColumn(
              title: 'Tercer columna',
              text: 'Tercer parrafo',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("click"),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
