import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greate_places_app/models/place.dart';

class GreatPlaces with ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedTitle, File image) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: pickedTitle,
        location: null,
        image: image);
    _items.add(newPlace);
    notifyListeners();
  }
}
