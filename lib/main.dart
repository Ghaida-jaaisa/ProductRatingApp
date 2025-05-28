import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()) ;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // variables
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  List<int> rating = [];
  int _rateValue = 1;
  late int avgRate = 1;
  String userName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          onChanged: () {

          },
          key:  _key,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Your Name" ,
                ),
                validator: (val) {
                  if (val!.isEmpty || val == null) {
                    return 'Please Enter Your Name';
                  }
                  return null ;
                },
                onSaved: (val) {
                  setState(() {
                    userName = val!;
                  });
                },
              ) ,
              Text("How satisfied are you with the product?") ,
              Row(
                children: [
                  Radio(value: 1, groupValue: _rateValue, onChanged: (val) => null) ,
                  Text("1 Star")
                ],
              ),

              Row(
                children: [
                  Radio(value: 2, groupValue: _rateValue, onChanged: (val) => null) ,
                  Text("2 Star")
                ],
              ),

              Row(
                children: [
                  Radio(value: 3, groupValue: _rateValue, onChanged: (val) => null) ,
                  Text("3 Star")
                ],
              ),
              ElevatedButton(onPressed: () {
                if(_key.currentState!.validate()) {
                  _key.currentState!.save();
                  print("Done");
                }
              }, child: Text("Submit")) ,
              SizedBox(height: 50.0,),
              Text("Thank you, ${userName}! Your rating: ${_rateValue} \n Average Rating: ${avgRate}")
            ],

          )),
    );
  }
}

