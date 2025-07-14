import 'package:flutter/material.dart';
import 'package:debi_driver_app/constants/plate_constants.dart';

class PlateInputWidget extends StatefulWidget {
  final String? initialProvince;
  final String? initialCity;
  final String? initialPlate;
  final ValueChanged<String>? onPlateChanged;

  const PlateInputWidget({
    Key? key,
    this.initialProvince,
    this.initialCity,
    this.initialPlate,
    this.onPlateChanged,
  }) : super(key: key);

  @override
  State<PlateInputWidget> createState() => _PlateInputWidgetState();
}

class _PlateInputWidgetState extends State<PlateInputWidget> {
  late String selectedProvince;
  late String selectedCity;
  late TextEditingController plateController;

  @override
  void initState() {
    super.initState();
    selectedProvince = widget.initialProvince ?? kProvinces.first;
    selectedCity = widget.initialCity ?? kCities.first;
    plateController = TextEditingController(text: widget.initialPlate ?? '');
  }

  @override
  void dispose() {
    plateController.dispose();
    super.dispose();
  }

  void _onChanged() {
    if (widget.onPlateChanged != null) {
      widget.onPlateChanged!(
        '$selectedProvince$selectedCity${plateController.text}',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const double inputHeight = 48;
    const TextStyle plateTextStyle = TextStyle(fontSize: 18, color: Colors.black);
    return SizedBox(
      height: inputHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: inputHeight,
            child: DropdownButton<String>(
              value: selectedProvince,
              isDense: true,
              style: plateTextStyle,
              underline: const SizedBox(),
              alignment: Alignment.center,
              onChanged: (v) {
                setState(() => selectedProvince = v!);
                _onChanged();
              },
              items: kProvinces
                  .map((p) => DropdownMenuItem(
                        value: p,
                        child: Text(p, style: plateTextStyle),
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            height: inputHeight,
            child: DropdownButton<String>(
              value: selectedCity,
              isDense: true,
              style: plateTextStyle,
              underline: const SizedBox(),
              alignment: Alignment.center,
              onChanged: (v) {
                setState(() => selectedCity = v!);
                _onChanged();
              },
              items: kCities
                  .map((c) => DropdownMenuItem(
                        value: c,
                        child: Text(c, style: plateTextStyle),
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: SizedBox(
              height: inputHeight,
              child: TextField(
                controller: plateController,
                decoration: InputDecoration(
                  labelText: '号牌',
                  labelStyle: const TextStyle(fontSize: 16, color: Colors.black),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                style: plateTextStyle,
                onChanged: (v) => _onChanged(),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 