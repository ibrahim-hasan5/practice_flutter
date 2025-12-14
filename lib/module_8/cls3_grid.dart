import 'package:flutter/material.dart';

class GridV extends StatelessWidget {
  const GridV({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green, title: Text('Grid View')),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 25,
            mainAxisSpacing: 25
          ),
          itemCount: 20,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
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
                    Text('phn-${index}',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white
                      ),)
                  ],
                ),
              ),
            );
          }
      )


      // GridView.count(
      //   crossAxisCount: 3,
      //   padding: EdgeInsets.all(10),
      //   crossAxisSpacing: 10,
      //   mainAxisSpacing: 10,
      //   children: List.generate(
      //     10,
      //     (index) => Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Container(
      //         width: 150,
      //         height: 150,
      //         decoration: BoxDecoration(
      //           //color: Colors.green,
      //           gradient: LinearGradient(
      //             colors: [Colors.blue, Colors.purple],
      //             begin: Alignment.topLeft,
      //             end: Alignment.bottomRight,
      //           ),
      //           borderRadius: BorderRadius.circular(10),
      //           boxShadow: [
      //             BoxShadow(
      //               color: Colors.grey,
      //               blurRadius: 20,
      //               offset: Offset(0, 20),
      //             ),
      //             BoxShadow(
      //               color: Colors.red,
      //               blurRadius: 20,
      //               offset: Offset(10, 0),
      //             ),
      //           ],
      //         ),
      //         child: Column(
      //           children: [
      //             Icon(Icons.phone, size: 50, color: Colors.grey),
      //             Text(
      //               'phn',
      //               style: TextStyle(fontSize: 25, color: Colors.white),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
