import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProviderClassDemo with ChangeNotifier, DiagnosticableTreeMixin {
List listItems =[];
TextEditingController text = TextEditingController();

bool loader = false;
addItem({required String text}) {
  loader= true;

  listItems.add(text);
  loader= false;
  notifyListeners();




}

removeItem({required int index}) {
  loader= true;

  listItems.removeAt(index);
  loader= false;
  notifyListeners(  );



}

editItem({required String text, required int index}) {
  loader= true;
  listItems.removeAt(index);
  listItems.insert(index, text);
  loader= false;
  notifyListeners();


}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  super.debugFillProperties(properties);
  properties.add(IterableProperty('listItems', listItems));
}
}