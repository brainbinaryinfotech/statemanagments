import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class ListStateNotifier extends ChangeNotifier {


  final listItems = StateProvider((ref) => []);

  addItem({required String text,required WidgetRef ref }) {


    ref.read(listItems.notifier).state.add(text);


  }

  removeItem({required int index,required WidgetRef ref}) {


    ref.read(listItems.notifier).state.removeAt(index);


  }

  editItem({required String text, required int index,required WidgetRef ref}) {


    ref.read(listItems.notifier).state.removeAt(index);
    ref.read(listItems.notifier).state.insert(index, text);



  }

}