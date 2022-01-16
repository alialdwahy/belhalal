import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AgeSlider extends StatefulWidget {
  double age = 21;
  Color thumbColor;
  Color activeColor;
  Color inactiveColor;
  Color textColor;
  Function(double)? onChange;

AgeSlider({Key? key, 
    required this.age,
    required this.thumbColor,
    required this.activeColor,
    required this.inactiveColor,
    required this.textColor,
     this.onChange,
  }) : super(key: key);

  @override
  _AgeSliderState createState() => _AgeSliderState();
}

class _AgeSliderState extends State<AgeSlider> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SliderTheme(
            data: SliderThemeData(
              valueIndicatorColor: Colors.blueGrey,
              thumbColor: widget.thumbColor,
            ),
            child: Slider(
              max: 70,
              min: 21,
              divisions: 49,
              label: widget.age.round().toString(),
              value: widget.age,
              onChanged: widget.onChange,
              activeColor: widget.activeColor,
              inactiveColor: widget.inactiveColor,
            ),
          ),
        ),
        Text(
          ': العمر',
          style: TextStyle(
              fontSize: 18,
              color: widget.textColor,
              fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}
