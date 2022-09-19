import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:greate_places_app/helpers/db_helper.dart';
import 'package:greate_places_app/helpers/location.dart';
import 'package:greate_places_app/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  Place findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> addPlace(
      String pickedTitle, File image, PlaceLocation pickedLocation) async {
    final adress = await LocationHelper.getPlaceAdress(
        pickedLocation.latitude, pickedLocation.longitude);
    final updateLocation = PlaceLocation(
        latitude: pickedLocation.latitude,
        longitude: pickedLocation.longitude,
        address: adress);
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: pickedTitle,
        location: updateLocation,
        image: image);
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image!,
      'loc_lat': newPlace.location!.latitude,
      'loc_lng': newPlace.location!.longitude,
      'address': newPlace.location!.address as Object
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map((e) => Place(
            id: e['id'] as String,
            title: e['title'] as String,
            location: PlaceLocation(
                latitude: e['loc_lat'] as double,
                longitude: e['loc_lng'] as double,
                address: e['address'] as String),
            image: File(e['image'] as String)))
        .toList();
    notifyListeners();
  }
}
