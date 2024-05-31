import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GetHomeController extends GetxController{
  TextEditingController text = TextEditingController();
List listItems =[];
bool loader = false;
  addItem({required String text}) {
    loader= true;
    update(['list']);

    listItems.add(text);
    loader= false;

    update(['list']);


  }

  removeItem({required int index}) {
    loader= true;
    update(['list']);
    listItems.removeAt(index);
    loader= false;

    update(['list']);

  }

  editItem({required String text, required int index}) {
    loader= true;
    update(['list']);
    listItems.removeAt(index);
    listItems.insert(index, text);
    loader= false;

    update(['list']);
  }

}