import 'package:flutter/material.dart';
import 'package:practice/home.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController phoneController = TextEditingController();
    TextEditingController passController = TextEditingController();
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green, title: Text('Login')),
      body: Column(
        children: [
          Image.asset('asset/download.jpeg', height: 400, width: 400),
          Text('pic'),
          SizedBox(height: 20),

          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Phone Number'),
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Phone Num',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'pls enter phn num';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: passController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'pls enter pass';
                      } else if (value.length <= 6) {
                        return 'pass must be at least 6 char';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 20),

                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('login successful')),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home(phone: phoneController.text,)),
                          );
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(onPressed: (){
                    Navigator.pushNamed(context, 'btns');
                  }, child: Text('BTNS')),
                  SizedBox(height: 10,),
                  ElevatedButton(onPressed: (){
                    Navigator.pushReplacementNamed(context, 'home');
                  }, child: Text('home')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
