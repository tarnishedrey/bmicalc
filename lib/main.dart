import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _height = 0;
  double _weight = 0;
  String _bmiResult = '';

  void _calculateBMI() {
    double bmi = _weight / (_height / 100 * _height / 100);
    setState(() {
      if (bmi < 18.5) {
        _bmiResult = 'Kurus';
      } else if (bmi < 25) {
        _bmiResult = 'Normal';
      } else {
        _bmiResult = 'Gemuk';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _weight = double.parse(value);
                });
              },
              decoration: InputDecoration(
                labelText: 'Berat (kg)',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _height = double.parse(value);
                });
              },
              decoration: InputDecoration(
                labelText: 'Tinggi (cm)',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _calculateBMI,
            child: Text('Hitung BMI'),
          ),
          Text('Hasil: $_bmiResult'),
        ],
      ),
    );
  }
}
