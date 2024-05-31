import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ObxHomeController extends GetxController{
  Rx<TextEditingController> text = TextEditingController().obs;
  RxList listItems =[].obs;
  RxBool loader = false.obs;
  addItem({required String text}) {
    loader.value= true;

    listItems.add(text);
    loader.value= false;


  }

  removeItem({required int index}) {
    loader.value= true;
    listItems.removeAt(index);
    loader.value= false;


  }

  editItem({required String text, required int index}) {
    loader.value= true;
    listItems.removeAt(index);
    listItems.insert(index, text);
    loader.value= false;

  }
}