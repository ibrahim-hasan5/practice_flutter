import 'package:flutter/material.dart';

class Flutterinput extends StatelessWidget {
  const Flutterinput({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('flutter input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            
            Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Facebook_New_Logo_%282015%29.svg/2560px-Facebook_New_Logo_%282015%29.svg.png'),
            SizedBox(height: 10,),
            Image.asset('asset/download.jpeg'),
            
            SizedBox(height: 10,),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              maxLength: 11,
              cursorColor: Colors.amberAccent,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                suffixIcon: Icon(Icons.check),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50)
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: Colors.grey)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.orange)
                ),
                filled: true,
                contentPadding: EdgeInsets.all(20),
                //fillColor: Colors.blueGrey.shade100,
                hintText: 'enter phn num',
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.green
                ),
                helperText: '017*****',
                helperStyle: TextStyle(
                  color: Colors.deepPurple
                ),
                labelText: 'phn num',
                labelStyle: TextStyle(
                  color: Colors.red
                ),

              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.remove_red_eye),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50)
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.grey)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.orange)
                ),
                hintText: 'enter pass',
                hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.green
                ),
                helperText: '*****',
                helperStyle: TextStyle(
                    color: Colors.deepPurple
                ),
                labelText: 'password',
                labelStyle: TextStyle(
                    color: Colors.red
                ),

              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  print(phoneController.text);
                  print(passwordController.text);
                  phoneController.clear();
                  passwordController.clear();

                }, child: Text('Submit'))),
          ],
        ),
      ),
    );
  }
}
