import 'package:flutter/material.dart';
import 'package:search_with_hint/models/movie_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  static List<MovieModel> main_movie_list = [
    MovieModel('The Transporter', 2019, 5),
    MovieModel('Harry Porter', 2010, 4.5),
    MovieModel('Titanic', 2000, 4),
    MovieModel('Commando', 2020, 3),
  ];

  List<MovieModel> display_list = List.from(main_movie_list);

  void updateList(String value) {
    setState(() {
      display_list = main_movie_list.where((element) => element.movie_title!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Search'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Search a Movie", style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),),
            SizedBox(height: 20.0,),
            TextField(
              onChanged: (value){
                updateList(value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    width: 2.0,
                    color: Colors.grey,
                  ),
                ),
                hintText: 'Eg: The Transporter',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 20.0,),
            Expanded(
                child: display_list.length == 0
                    ? Center(child: Text("No result found"))
                    : ListView.builder(
                    itemCount: display_list.length,
                    itemBuilder: (context, index){
                      return ListTile(
                        contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                        title: Text(display_list[index].movie_title!),
                        subtitle: Text(display_list[index].movie_release_year.toString()),
                        trailing: Text(display_list[index].rating.toString()),
                      );
                    }
                ),
            ),
          ],
        ),
      ),
    );
  }
}

