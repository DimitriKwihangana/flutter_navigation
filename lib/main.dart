import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit List',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: FruitListPage(),
    );
  }
}

class Fruit {
  final String name;
  final String description;

  Fruit(this.name, this.description);
}

class FruitListPage extends StatelessWidget {
  final List<Fruit> fruits = [
    Fruit('Apple', 'A sweet red fruit'),
    Fruit('Banana', 'A long yellow fruit'),
    Fruit('Orange', 'A round orange fruit'),
    Fruit('Strawberry', 'A small red fruit'),
    Fruit('Grapes', 'A bunch of small purple fruits'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fruits'),
      ),
      body: ListView.builder(
        itemCount: fruits.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(fruits[index].name),
            subtitle: Text(fruits[index].description),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FruitDetailPage(fruit: fruits[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class FruitDetailPage extends StatelessWidget {
  final Fruit fruit;

  FruitDetailPage({required this.fruit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(fruit.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fruit.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              fruit.description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
