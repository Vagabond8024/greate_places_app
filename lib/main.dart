import 'package:flutter/material.dart';
import 'package:greate_places_app/providers/great_places.dart';
import 'package:greate_places_app/screens/add_place_screen.dart';
import 'package:greate_places_app/screens/place_detail_screen.dart';
import 'package:greate_places_app/screens/placecs_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
            primarySwatch: Colors.indigo,
            colorScheme: ColorScheme.fromSwatch(accentColor: Colors.amber)),
        home: const PlacesListScreen(),
        routes: {
          AddPlaceScreen.routName: (context) => const AddPlaceScreen(),
          PlaceDetailScreen.routName:(context) => const PlaceDetailScreen(),
        },
      ),
    );
  }
}
