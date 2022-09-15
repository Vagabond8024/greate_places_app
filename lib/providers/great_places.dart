import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greate_places_app/helpers/db_helper.dart';
import 'package:greate_places_app/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

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
    DBHelper.insert('places',
        {'id': newPlace.id, 'title': newPlace.title, 'image': newPlace.image!});
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('places');
    _items = dataList
        .map((e) => Place(
            id: e['id'] as String,
            title: e['title'] as String,
            location: null,
            image: File(e['image'] as String)))
        .toList();
    notifyListeners();
  }
}
