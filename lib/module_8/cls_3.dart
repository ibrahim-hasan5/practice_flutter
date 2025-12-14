import 'package:flutter/material.dart';
class container extends StatelessWidget {
  const container({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Grid view'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                //color: Colors.green,
                gradient: LinearGradient(
                    colors: [Colors.blue,Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 20,
                    offset: Offset(0, 20)
                  ),
                  BoxShadow(
                      color: Colors.red,
                      blurRadius: 20,
                      offset: Offset(10, 0)
                  )
                ]
              ),
              child: Column(
                children: [
                  Icon(Icons.phone,size: 50, color: Colors.grey,),
                  Text('phn',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white
                  ),)
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
