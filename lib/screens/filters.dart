import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FiltersScreen>  {
  var _glutenFreeCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: Column(
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
          )
        ],
      ),
    );
  }
}