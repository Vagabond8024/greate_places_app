import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImage;

  Future<void> _getCurrentLocation() async {
    final locData = await Location().getLocation(); 

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: _previewImage == null
              ? Text(
                  'No location chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
                onPressed: _getCurrentLocation,
                icon: Icon(Icons.location_on),
                label: Text(
                  "Current location",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.map),
                label: Text(
                  "Current location",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ))
          ],
        )
      ],
    );
  }
}
