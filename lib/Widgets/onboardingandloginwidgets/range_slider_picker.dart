import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:vibration/vibration.dart';

class RangeSliderPicker extends StatefulWidget {
  int minumumValue;
  int maximumValue;
  int initialValue;
  String heading;
  String units;
  int pickerValue = 100;
  RangeSliderPicker(
      {required this.minumumValue,
      required this.maximumValue,
      required this.initialValue,
      required this.heading,
      required this.units}) {
    pickerValue = initialValue;
  }

  @override
  State<RangeSliderPicker> createState() => _RangeSliderPickerState();
}

class _RangeSliderPickerState extends State<RangeSliderPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${widget.heading}\n(In ${widget.units})',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(158, 158, 158, 0.3), blurRadius: 5)
                ]),
            child: NumberPicker(
                minValue: widget.minumumValue,
                maxValue: widget.maximumValue,
                value: widget.pickerValue,
                onChanged: (value) {
                  try {
                    Vibration.vibrate(duration: 20);
                  } catch (e) {
                    print('Virbrator cannot be used - $e');
                  }
                  setState(() {
                    widget.pickerValue = value;
                  });
                }),
          ),
          Align(
            alignment: Alignment(0.6, 0),
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop(widget.pickerValue);
                },
                child: Text(
                  'Done',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xFF92A3FD)),
                )),
          )
        ],
      ),
    );
  }
}
