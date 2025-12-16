import 'package:flutter/material.dart';
class md11_Class3 extends StatelessWidget {
  const md11_Class3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Text('TEST',
          style: TextStyle(
            fontSize: 20
          ),),
          Text('TEST',
            style: TextStyle(
                fontSize: 20
            ),),
          Text('TEST',
            style: TextStyle(
                fontSize: 20
            ),),
          Text('TEST',
            style: TextStyle(
                fontSize: 20
            ),),

          Expanded(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text(index.toString()),
                  );
                }),
          ),

          Container(
            height: 200,
            width: 200,
            color: Colors.red,

          ),

          Flexible(
            flex: 3,
            child: Container(
              height: 200,
              width: 200,
              color: Colors.green,
            
            ),
          ),

          Flexible(
            flex: 1,
            child: Container(
              height: 200,
              width: 200,
              color: Colors.orange,

            ),
          ),
        ],
      ),
    );
  }
}
