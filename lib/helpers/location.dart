import 'package:greate_places_app/helpers/google_api_key.dart';

class LocationHelper {
  static String generateLocationPreview({double? latitude, double? longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GOOGLE_API_KEY&signature=YOUR_SIGNATURE';
  }
}
