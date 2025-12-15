import 'package:flutter/material.dart';
class DogCard extends StatelessWidget {
  final String img, title, rating;
  DogCard({
    super.key, required this.img, required this.title, required this.rating
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 200,
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: NetworkImage(img)
                )
            ),
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent,Colors.black45]
                  )
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 50,
            right: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
                Text(rating,
                  style: TextStyle(
                      color: Colors.white
                  ),)
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 50,
            right: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Animal',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.favorite, color: Colors.red,))
              ],
            ),
          ),
        ],
      ),
    );
  }
}