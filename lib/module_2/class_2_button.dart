import 'package:flutter/material.dart';

class Buttongrp extends StatelessWidget {
  const Buttongrp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Button GRP',
        style: TextStyle(
          color: Colors.deepPurple
        ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(200),
                  ),
                ),
                onPressed: (){},
                child: Text('Submit')),
            SizedBox(height: 10,),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(200),
                    ),
                  ),
                  onPressed: (){},
                  child: Text('Submit')),
            ),
            SizedBox(height: 10,),
            SizedBox(
                height: 30,
                width: 200,
                child: OutlinedButton(onPressed: (){}, child: Text("outline"))),
            TextButton(onPressed: (){
              print("working");
              }, 
                child: Text("read more")),
            Icon(Icons.add),
            SizedBox(height: 10,),
            IconButton(onPressed: (){print("dlt");}, icon: Icon(Icons.delete, color: Colors.red,size: 80,)),

            GestureDetector(
              onLongPress: (){print("lng prs");},

                child: Text('lng')),
            GestureDetector(
                onDoubleTap: (){print("dbl tap");},

                child: Text('double')),
            GestureDetector(
                onLongPress: (){print("lng prs");},
                onDoubleTap: (){print("dbl tap");},

                child: Text('This is test')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
          foregroundColor: Colors.deepPurple,
          onPressed: (){print("addd");},
        child: Icon(Icons.add),
      ),
    );
  }
}
