import 'package:flutter/material.dart';
import 'package:practice/module_9/widget/dog_card.dart';
class Cls2Stack extends StatelessWidget {
  const Cls2Stack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Stack'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            DogCard(img: 'https://www.shutterstock.com/image-photo/happy-golden-retriever-shiba-dogs-600nw-2413261731.jpg',
              title: 'Pair Dog', rating: '5.0',),

            SizedBox(height: 10,),
            Stack(
              children: [
                Container(
                  color: Colors.red,
                  height: 200,
                  width: 200,
                ),

                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  top: 10,
                  child: Container(
                    color: Colors.green,
                    height: 150,
                    width: 180,
                  ),
                ),

                Positioned(
                  top: 20,
                  right: 20,
                  bottom: 20,
                  child: Container(
                    color: Colors.purple,
                    height: 100,
                    width: 150,
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            Stack(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage('https://hips.hearstapps.com/hmg-prod/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=0.752xw:1.00xh;0.175xw,0&resize=1200:*'),
                ),
                Positioned(
                  bottom: 18,
                  right: 4,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white,width: 3)
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

