import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textFieldController1 = TextEditingController();
  TextEditingController _textFieldController2 = TextEditingController();
  TextEditingController _textFieldController3 = TextEditingController();

  double _bmi = 0;
  String _bmiMessage = "";
  String? radioGender;

  void _onSubmit() async{
    String name = _textFieldController1.text;

    double weight = double.parse(_textFieldController3.text);
    double height = double.parse(_textFieldController2.text);

    if (weight > 0 && height > 0){
      _bmi = weight/(height*height/10000);

      if(radioGender == 'Male'){
        if(_bmi < 18.5){
          _bmiMessage = "Underweight. Careful during strong wind!";
        }
        else if (_bmi < 25){
          _bmiMessage = "That’s ideal! Please maintain";
        }
        else if (_bmi < 30){
          _bmiMessage = "Overweight! Work out please";
        }
        else if (_bmi >= 30){
          _bmiMessage = "Whoa Obese! Dangerous mate!";
        }
      }
      else if (radioGender == 'Female'){
        if(_bmi < 16){
          _bmiMessage = "Underweight. Careful during strong wind!";
        }
        else if (_bmi < 22){
          _bmiMessage = "That’s ideal! Please maintain";
        }
        else if (_bmi < 27){
          _bmiMessage = "Overweight! Work out please";
        }
        else if (_bmi >= 37){
          _bmiMessage = "Whoa Obese! Dangerous mate!";
        }
      }
      setState(() {});
    }
    else{
      _bmiMessage = "Invalid input";
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _textFieldController1,
              decoration: InputDecoration(hintText: 'Your Fullname'),
            ),
            TextField(
              controller: _textFieldController2,
              decoration: InputDecoration(hintText: 'height in cm; 170'),
            ),
            TextField(
              controller: _textFieldController3,
              decoration: InputDecoration(labelText: 'Weight in KG'),
            ),
            SizedBox(height: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  title: Text('BMI Value'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: 'Male',
                      groupValue: radioGender,
                      onChanged: (String? value) {
                        setState(() {
                          radioGender = value;
                        });
                      },
                    ),
                    Text('Male'),
                    Radio(
                      value: 'Female',
                      groupValue: radioGender,
                      onChanged: (String? value) {
                        setState(() {
                          radioGender = value;
                        });
                      },
                    ),
                    Text('Female'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _onSubmit,
              child: Text('Calculate BMI and Save'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Your BMI is $_bmi',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Text(
              _bmiMessage,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}