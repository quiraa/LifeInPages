import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ProductCounter extends StatefulWidget {
  final Color buttonColor;
  const ProductCounter({Key? key, required this.buttonColor}) : super(key: key);

  @override
  _ProductCounterState createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildDecrementButton(),
        const SizedBox(width: 16),
        _buildCounterText(),
        const SizedBox(width: 16),
        _buildIncrementButton(),
      ],
    );
  }

  Widget _buildDecrementButton() {
    return GestureDetector(
      onTap: () => setState(() {
        if (_counter > 0) {
          _counter--;
        }
      }),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 2,
            color: widget.buttonColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Ionicons.remove_outline,
            color: widget.buttonColor,
          ),
        ),
      ),
    );
  }

  Widget _buildCounterText() {
    return Text(
      '$_counter',
      style: const TextStyle(fontSize: 18),
    );
  }

  Widget _buildIncrementButton() {
    return GestureDetector(
      onTap: () => setState(() => _counter++),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 2,
            color: widget.buttonColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Ionicons.add_outline,
            color: widget.buttonColor,
          ),
        ),
      ),
    );
  }
}
