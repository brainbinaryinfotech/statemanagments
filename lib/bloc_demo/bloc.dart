

import 'package:block_demo/bloc_demo/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';

class CounterCubit extends Bloc<CounterEvent,CounterState> {
    TextEditingController text = TextEditingController();
    List listItems = [];
  CounterCubit() : super(CounterLoaded([])) {

on<CounterEvent>((event,emit){
  try {
    emit(CounterLoading());
    emit(CounterLoaded(listItems));
  }
  catch(e)
  {
    emit(CounterError(e.toString()));
  }

});


  }

  addItem({required String text}) {
    listItems.add(text);
    return emit(CounterLoaded(listItems));

  }

  removeItem({required int index}) {
    listItems.removeAt(index);
    return emit(CounterLoaded(listItems));
  }

  editItem({required String text, required int index}) {
    listItems.removeAt(index);
    listItems.insert(index, text);
    return emit(CounterLoaded(listItems));
  }
}