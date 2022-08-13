import 'package:daily_meal_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {

  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(String title, String description, bool currentValue, Function updateValue){
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: currentValue,
        onChanged: updateValue
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
              onPressed: (){
                final saveFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(saveFilters);
              },
              icon: Icon(Icons.save),
          ),
        ],
      ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(padding: EdgeInsets.all(20), child: Text('Adjust your meal selection', style: Theme.of(context).textTheme.titleMedium,),),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile('Gluten-Free', 'Only Include Gluten Free Meal', _glutenFree, (newValue){setState(() {
                    _glutenFree = newValue;
                  });}),
                  _buildSwitchListTile('Lactose-Free', 'Only Include Lactose Free Meal', _lactoseFree, (newValue){setState(() {
                    _lactoseFree = newValue;
                  });}),
                  _buildSwitchListTile('Vagetarian', 'Only Include Vagetairan Meal', _vegetarian, (newValue){setState(() {
                    _vegetarian = newValue;
                  });}),
                  _buildSwitchListTile('vegan', 'Only Include Vegan Meal', _vegan, (newValue){setState(() {
                    _vegan = newValue;
                  });}),
                ],
              ),
            ),
          ],
        ));
  }
}
