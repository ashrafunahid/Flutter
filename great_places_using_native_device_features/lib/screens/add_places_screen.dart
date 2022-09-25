import 'dart:io';
import 'package:flutter/material.dart';
import 'package:great_places_using_native_device_features/models/place.dart';
import 'package:great_places_using_native_device_features/widgets/location_input.dart';
import 'package:provider/provider.dart';
import '../providers/great_places.dart';
import '../widgets/image_input.dart';
import '../models/place.dart';

class AddPlacesScreen extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  State<AddPlacesScreen> createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends State<AddPlacesScreen> {

  final _titleController = TextEditingController();

  File _pickedImage;
  PlaceLocation _pickedLocation;

  void _selectImage(File pickedImage){
    setState(() {
      _pickedImage = pickedImage;
    });
  }

  void _selectPlace(double lat, double lng){
    _pickedLocation = PlaceLocation(latitude: lat, longitude: lng);
  }

  void _savePlace(){
    if(_titleController.text.isEmpty || _pickedImage == null || _pickedLocation == null){
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false).addPlace(_titleController.text, _pickedImage, _pickedLocation);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                    ),
                    SizedBox(height: 10,),
                    ImageInput(_selectImage),
                    SizedBox(height: 10,),
                    LocationInput(_selectPlace),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
              onPressed: _savePlace,
              icon: Icon(Icons.add),
            label: Text('Add Place'),
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
