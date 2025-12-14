import 'package:flutter/material.dart';

class ThemeTest extends StatelessWidget {
  const ThemeTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Theme'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('test',
            style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 10,),
            TextField(),
            SizedBox(height: 10,),
            TextField(),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){}, child: Text('test test'))
          ],
        ),
      ),
    );
  }
}
