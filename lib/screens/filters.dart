import 'package:flutter/material.dart';
import 'package:meal_app/screens/tabs.dart';
import 'package:meal_app/widgets/main_drawer.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.selectedFilters});

  final Map<Filter,bool> selectedFilters;

  @override
  State<StatefulWidget> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FiltersScreen>  {
  var _glutenFreeCheck = false;
  var _lactoseFreeCheck = false;
  var _vegitarainFreeCheck = false;
  var _veganCheck = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeCheck = widget.selectedFilters[Filter.glutenFree]!;
    _lactoseFreeCheck = widget.selectedFilters[Filter.lactoseFree]!;
    _vegitarainFreeCheck = widget.selectedFilters[Filter.vegetarian]!;
    _veganCheck = widget.selectedFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      // drawer: MainDrawer(onSelectIdentifier: (identifier) {
      //   Navigator.of(context).pop();
      //   if(identifier == 'meal') {
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(
      //         builder: (ctx) {
      //           return const TabsScreen();
      //         }
      //       )
      //     );
      //   }
      // },),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          if(didPop) 
            return;
          Navigator.of(context).pop({
            Filter.glutenFree : _glutenFreeCheck,
            Filter.lactoseFree : _lactoseFreeCheck,
            Filter.vegetarian: _vegitarainFreeCheck,
            Filter.vegan: _veganCheck
          });
        },
        child: Column(
          children: [
            SwitchListTile(value: _glutenFreeCheck, onChanged: (chk) {
              setState(() {
                _glutenFreeCheck = chk;
              });
            }, title: Text("Gluten-Free", style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
            ),),
            subtitle: Text("Only include gluten-free meal",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
            ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 43, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeCheck,
              onChanged: (chk) {
                setState(() {
                  _lactoseFreeCheck = chk;
                });
              },
              title: Text(
                "Lactose-Free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              subtitle: Text(
                "Only include lactose-free meal",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left : 43, right : 22),
            ),
            SwitchListTile(value: _vegitarainFreeCheck, 
              onChanged: (chk) {
                setState(() {
                  _vegitarainFreeCheck = chk;
                });
              },
              title: Text(
                "Vegetarian",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              subtitle: Text(
                "only Vegetarain-food",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left : 43, right : 22),
            ),
            SwitchListTile(
              value: _veganCheck,
              onChanged : (chk) {
                setState(() {
                  _veganCheck = chk;
                });
              },
              title: Text(
                "vegan",
                style : Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground
                )
              ),
              subtitle: Text(
                "only vegan-food",
                style : Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground
                )
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 43, right: 22),
            )
        
          ],
        
        ),
      ),

    );
  }
}