import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String phone;
  final String ? password;
   Home({super.key, required this.phone, this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('rowww',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('rowww',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('rowww',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('rowww',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('rowww',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('rowww',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('rowww',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('rowww',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            
            Text('Ibu home page',
              style: TextStyle(
                fontSize: 50,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),

            ),
            Text('Ibu home page',
              style: TextStyle(
                fontSize: 50,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),

            ),

            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('back')),
            Text(phone),
          ],
        ),
      )
    );
  }
}
