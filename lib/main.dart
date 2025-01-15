import 'package:flutter/material.dart';

void main() => runApp(ListViewBuilderApp());

class ListViewBuilderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListViewBuilderScreen(),
    );
  }
}

class ListViewBuilderScreen extends StatelessWidget {
  // Sample data
  final List<String> items = List.generate(20, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Builder UI'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                ),
                title: Text(
                  items[index],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Description of ${items[index]}'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${items[index]} tapped!')),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
