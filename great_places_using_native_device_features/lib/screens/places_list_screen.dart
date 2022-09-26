import 'package:flutter/material.dart';
import 'add_places_screen.dart';
import 'package:provider/provider.dart';
import '../providers/great_places.dart';
import './place_detail_screen.dart';

class PlacesListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(AddPlacesScreen.routeName);
          },
              icon: Icon(Icons.add)
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).fetchAndSetPlaces(),
        builder: (context, snapshot) => snapshot.connectionState == ConnectionState.waiting ? Center(child: CircularProgressIndicator(),) : Consumer<GreatPlaces>(
          child: Center(child: Text('Got no places yet, Start adding some!')),
          builder: (context, greatPlaces, ch) => greatPlaces.items.length <=0 ? ch : ListView.builder(
            itemCount: greatPlaces.items.length,
              itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: FileImage(greatPlaces.items[index].image),
                ),
                title: Text(greatPlaces.items[index].title),
                subtitle: Text(greatPlaces.items[index].location.address),
                onTap: (){
                  Navigator.of(context).pushNamed(PlaceDetailScreen.routeName, arguments: greatPlaces.items[index].id);
                },
              );
              }
          ),
        ),
      ),
    );
  }
}
