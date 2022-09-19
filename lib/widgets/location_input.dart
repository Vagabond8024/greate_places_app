import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:greate_places_app/helpers/location.dart';
import 'package:greate_places_app/screens/map_screen.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  final Function onSelectPlace;
  const LocationInput({super.key, required this.onSelectPlace});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImage;
  void _showPreview(double lat, double lng) {
    final staticMapImageUrl =
        LocationHelper.generateLocationPreview(latitude: lat, longitude: lng);
  }

  Future<void> _getCurrentLocation() async {
    final locData = await Location().getLocation();
    _showPreview(locData.latitude!, locData.longitude!);
    final staticMapImageUrl = LocationHelper.generateLocationPreview(
        latitude: locData.latitude, longitude: locData.longitude);
    setState(() {
      _previewImage = staticMapImageUrl;
    });
    widget.onSelectPlace(locData.latitude, locData.longitude);
  }

  Future<void> _selectOnMap() async {
    final LatLng selectedLoaction =
        await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MapScreen(
        isSelecting: true,
      ),
    ));
    if (selectedLoaction == null) {
      return;
    }
    _showPreview(selectedLoaction.latitude, selectedLoaction.longitude);
    widget.onSelectPlace(selectedLoaction.latitude, selectedLoaction.longitude);
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
                onPressed: _selectOnMap,
                icon: Icon(Icons.map),
                label: Text(
                  "Select on map",
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
