import 'package:flutter/material.dart';
import 'package:multipageapp/widgets/appBar.dart';
import 'package:multipageapp/widgets/maindrawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String,bool> currentFilters;

  FilterScreen(this.currentFilters,this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;

    super.initState();
    
  }

  Widget _switchbuilder(
    String title,
    String description,
    bool currentValue,
    Function(bool) updateValue,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          title: Text(
            title,
            style: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            description,
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
          ),

          trailing: Transform.scale(
            scale: 0.7,
            child: Switch(
              value: currentValue,
              onChanged: updateValue,
              activeColor: Colors.teal,
              inactiveThumbColor: Color.fromRGBO(10, 51, 51, 1),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final Map<String, bool> selectedFilter = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilter);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Container(
        // padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Adjust your meal',
                style: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _switchbuilder('Guten free', 'Only include', _glutenFree, (
                    newvalue,
                  ) {
                    setState(() {
                      _glutenFree = newvalue;
                    });
                  }),
                  _switchbuilder('Vegeterian', 'Vegetatian food', _vegetarian, (
                    newvalue,
                  ) {
                    setState(() {
                      _vegetarian = newvalue;
                    });
                  }),
                  _switchbuilder('Vegan', 'Vegan food', _vegan, (newvalue) {
                    setState(() {
                      _vegan = newvalue;
                    });
                  }),
                  _switchbuilder(
                    'lactose free',
                    'Does not contain lactose',
                    _lactoseFree,
                    (newvalue) {
                      setState(() {
                        _lactoseFree = newvalue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
