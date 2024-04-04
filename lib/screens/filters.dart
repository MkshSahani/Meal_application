import 'package:flutter/material.dart';
import 'package:meal_app/screens/tabs.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/filter_providers.dart';


class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final activeFilter = ref.watch(filterStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: Column(
          children: [
            SwitchListTile(value: activeFilter[Filter.glutenFree]!, onChanged: (chk) {
                ref.read(filterStateNotifierProvider.notifier).setFilter(Filter.glutenFree, chk);
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
              value: activeFilter[Filter.lactoseFree]!,
              onChanged: (chk) {
                ref.read(filterStateNotifierProvider.notifier).setFilter(Filter.glutenFree, chk);
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
            SwitchListTile(value: activeFilter[Filter.vegetarian]!, 
              onChanged: (chk) {
                ref.read(filterStateNotifierProvider.notifier).setFilter(Filter.vegetarian, chk);
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
              value: activeFilter[Filter.vegan]!,
              onChanged : (chk) {
                ref.read(filterStateNotifierProvider.notifier).setFilter(Filter.vegan, chk);
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
      );
  }
}