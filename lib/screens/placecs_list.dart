import 'package:flutter/material.dart';
import 'package:greate_places_app/screens/add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routName);
            },
          ),
        ],
      ),
      body: Center( 
        child: CircularProgressIndicator(),
      ),
    );
  }
}
