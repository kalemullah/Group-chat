import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _totalDots = 5;
  double _currentPosition = 0.0;

  double _validPosition(double position) {
    if (position >= _totalDots) return 0;
    if (position < 0) return _totalDots - 1.0;
    return position;
  }

  void _updatePosition(double position) {
    setState(() => _currentPosition = _validPosition(position));
  }

  Widget _buildRow(List<Widget> widgets) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widgets,
      ),
    );
  }

  String getCurrentPositionPretty() {
    return (_currentPosition + 1.0).toStringAsPrecision(2);
  }

  @override
  Widget build(BuildContext context) {
    const decorator = DotsDecorator(
      activeColor: Colors.green,
      activeSize: Size.square(30.0),
      activeShape: RoundedRectangleBorder(),
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GeeksForGeeks'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16.0),
            children: [
              Text(
                'Current position ${getCurrentPositionPretty()} / $_totalDots',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              _buildRow([
                Slider(
                  value: _currentPosition,
                  max: (_totalDots - 1).toDouble(),
                  onChanged: _updatePosition,
                )
              ]),
              _buildRow([
                FloatingActionButton(
                  child: const Icon(Icons.remove),
                  backgroundColor: Colors.green,
                  onPressed: () {
                    _currentPosition = _currentPosition.ceilToDouble();
                    _updatePosition(max(--_currentPosition, 0));
                  },
                ),
                FloatingActionButton(
                  child: const Icon(Icons.add),
                  backgroundColor: Colors.green,
                  onPressed: () {
                    _currentPosition = _currentPosition.floorToDouble();
                    _updatePosition(min(
                      ++_currentPosition,
                      _totalDots.toDouble(),
                    ));
                  },
                )
              ]),
              _buildRow([
                Text(
                  'Vertical',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
                ),
              ]),
              _buildRow([
                DotsIndicator(
                  dotsCount: _totalDots,
                  position: _currentPosition,
                  axis: Axis.vertical,
                  reversed: true,
                  decorator: decorator,
                ),
              ]),
              _buildRow([
                Text(
                    'Horizontal',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0)),
                DotsIndicator(
                  dotsCount: _totalDots,
                  position: _currentPosition,
                  decorator: decorator,
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
