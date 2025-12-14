import 'package:flutter/material.dart';
class FList extends StatelessWidget {
  const FList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('List View'),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context,index){
          //return Text('12 x $index = ${index*12}');
          return Card(
            child: ListTile(
              title: Text('ibrahim'),
              subtitle: Text('01723753975'),
              leading: Icon(Icons.phone),
              trailing: Icon(Icons.delete, color: Colors.red,),
            ),
          );
      },
      ),
    );
  }
}
