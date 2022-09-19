import 'dart:convert';

import 'package:greate_places_app/helpers/google_api_key.dart';
import 'package:http/http.dart' as http;

class LocationHelper {
  static String generateLocationPreview({double? latitude, double? longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }

  static Future<String> getPlaceAdress(double lat, double lng) async {
    final url = Uri.https(
      'maps.googleapis.com',
      '/maps/api/geocode/json',
      {'latlng': '$lat,$lng', 'key': '$GOOGLE_API_KEY'},
    );
    final response = await http.get(url);
    print(response.body);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
