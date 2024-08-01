import 'package:flutter/material.dart';

class GendertextField extends StatefulWidget {
  final double width;
  final double height;
  final List<String> options;
  final String hintText;

  const GendertextField({
    Key? key,
    required this.width,
    required this.height,
    required this.options,
    required this.hintText,
  }) : super(key: key);

  @override
  _GendertextFieldState createState() => _GendertextFieldState();
}

class _GendertextFieldState extends State<GendertextField> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.white,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        value: selectedOption,
        items: widget.options.map((String option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(option),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedOption = newValue;
          });
        },
        validator: (value) => value == null ? 'Please select an option' : null,
      ),
    );
  }
}
