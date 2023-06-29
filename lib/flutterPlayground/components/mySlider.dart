import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../provider/parameterProvider.dart';

class MySlider extends StatefulWidget {
  final double parameter;
  final double min;
  final double max;

  const MySlider({
    super.key,
    required this.parameter,
    required this.min,
    required this.max,
  });

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  @override
  Widget build(BuildContext context) {
    return SfSliderTheme(
      data: SfSliderThemeData(
          activeTrackHeight: 50, inactiveTrackHeight: 50, thumbRadius: 25),
      child: Consumer<ParameterProvider>(builder: (context, provider, child) {
        return SfSlider(
          value: widget.parameter,
          enableTooltip: true,
          showTicks: true,
          showLabels: true,
          min: widget.min,
          max: widget.max,
          onChanged: (value) {
            if (widget.parameter == provider.height) {
              provider.heightSlider(value);
            } else if (widget.parameter == provider.width) {
              provider.widthSlider(value);
            } else if (widget.parameter == provider.borderRadius) {
              provider.borderRadiusSlider(value);
            }
          },
        );
      }),
    );
  }
}
