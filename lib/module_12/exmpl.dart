import 'package:flutter/material.dart';
class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  bool isPassShow= true;
  bool isFav= false;

  toggle(){
    setState(() {
      isFav = !isFav;
    });
  }

  showPass(){
    setState(() {
      isPassShow = !isPassShow;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                obscureText: isPassShow ,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: IconButton(onPressed: showPass,
                      icon: Icon(
                          isPassShow ? Icons.remove_red_eye : Icons.visibility_off,))
                ),
              ),

              IconButton(onPressed: toggle,
                  color: isFav ? Colors.red: Colors.grey,
                  icon: Icon(Icons.favorite,size: 100,
                  ))
            ],
          )
      ),
    );
  }
}
