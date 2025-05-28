import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // متغيرات
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  double rateSum = 0;
  double rateCount = 0;
  double tempRate = 1;

  int _rateValue = 1;
  late double avgRate = 0;

  String userName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "Your Name"),
              validator: (val) {
                if (val!.isEmpty) {
                  return 'Please Enter Your Name';
                }
                return null;
              },
              onSaved: (val) {
                setState(() {
                  userName = val!;
                });
              },
            ),
            Text("How satisfied are you with the product?"),
            ...List.generate(4, (index) {
              int rate = index + 1;
              return RadioListTile<int>(
                title: Text("$rate Stars"),
                value: rate,
                groupValue: _rateValue,
                onChanged: (int? val) {
                  if (val != null) {
                    setState(() {
                      _rateValue = val;
                      tempRate = val.toDouble();
                    });
                  }
                },
              );
            }),
            ElevatedButton(
              onPressed: () {
                if (_key.currentState!.validate()) {
                  _key.currentState!.save();
                  print("Done");
                }
                setState(() {
                  rateSum += tempRate;
                  rateCount++;
                  avgRate = rateSum / rateCount;
                });
              },
              child: Text("Submit"),
            ),
            SizedBox(height: 50.0),
            Text(
                "Thank you, ${userName}! Your rating: ${_rateValue} \nAverage Rating: ${avgRate.round()}")
          ],
        ),
      ),
    );
  }
}
