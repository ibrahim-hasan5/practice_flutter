import 'package:flutter/material.dart';
import 'package:practice/module_9/hero_page.dart';
import 'package:practice/module_9/widget/dog_card.dart';

import 'cls_2_stack.dart';

class OwnWidget extends StatelessWidget {
  const OwnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DogCard(
                    img:
                        'https://www.shutterstock.com/image-photo/happy-golden-retriever-shiba-dogs-600nw-2413261731.jpg',
                    title: 'Pair Dog',
                    rating: '5.0',
                  ),

                  DogCard(
                    img:
                        'https://hips.hearstapps.com/hmg-prod/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=0.752xw:1.00xh;0.175xw,0&resize=1200:*',
                    title: 'Cute Dog',
                    rating: '4.0',
                  ),
                  DogCard(
                    img:
                        'https://images.squarespace-cdn.com/content/v1/54822a56e4b0b30bd821480c/45ed8ecf-0bb2-4e34-8fcf-624db47c43c8/Golden+Retrievers+dans+pet+care.jpeg',
                    title: 'Big Dog',
                    rating: '4.5',
                  ),
                  DogCard(
                    img:
                        'https://static.vecteezy.com/system/resources/thumbnails/005/857/332/small/funny-portrait-of-cute-corgi-dog-outdoors-free-photo.jpg',
                    title: 'Funny',
                    rating: '5.0',
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        Cls2Stack(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1, 0);
                          const end = Offset.zero;
                          const curve = Curves.ease;
                          var tween = Tween(
                            begin: begin,
                            end: end,
                          ).chain(CurveTween(curve: curve));
                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                  ),
                );
              },
              child: Text('Previous Class'),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HeroPage()),
                );
              },
              child: Hero(
                  tag: 'Prv cls',
                  child: Text('previous cls')),
            ),
          ],
        ),
      ),
    );
  }
}
