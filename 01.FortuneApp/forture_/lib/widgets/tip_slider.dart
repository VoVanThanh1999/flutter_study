
import 'package:flutter/material.dart';

class TipSlider extends StatelessWidget {
  const TipSlider({
    super.key,
    required double tipPersonTage,
    required this.onChange,
  }) : _tipPersonTage = tipPersonTage;

  final double _tipPersonTage;
  final ValueChanged<double> onChange;

  @override
  Widget build(BuildContext context) {
    return Slider(value: _tipPersonTage, onChanged: onChange);
  }
}