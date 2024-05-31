import 'package:block_demo/bloc_demo/bloc.dart';
import 'package:block_demo/bloc_demo/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocHomePage extends StatelessWidget {
  const BlocHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text( "Bloc Demo",),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent.withOpacity(0.2)
      ),
      body: BlocBuilder<CounterCubit,CounterState>(
        builder: (context,count){
          if(count is CounterLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          else if(count is CounterLoaded) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: 600,
                  child: (count.data != null && count.data != [] &&
                      count.data.isNotEmpty) ? ListView.builder(
                      itemCount: count.data.length,
                      itemBuilder: (context, i) {
                        return Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.deepPurpleAccent.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  children: [
                                    Text(count.data[i].toString()),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        IconButton(onPressed: () {
                                          context
                                              .read<CounterCubit>()
                                              .text.text = count.data[i];
                                          showDialog(
                                              context: context, builder: (con) {
                                            return AlertDialog(
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  TextFormField(
                                                    decoration: const InputDecoration(
                                                        hintText: "Please Enter List Items",
                                                        border: OutlineInputBorder(
                                                        )
                                                    ),
                                                    controller: context
                                                        .read<CounterCubit>()
                                                        .text,
                                                  ),
                                                  const SizedBox(height: 40,),
                                                  ElevatedButton(onPressed: () {
                                                    Navigator.of(context).pop();
                                                    context.read<CounterCubit>()
                                                        .editItem(text: context
                                                        .read<CounterCubit>()
                                                        .text
                                                        .text, index: i);
                                                    context
                                                        .read<CounterCubit>()
                                                        .text
                                                        .clear();
                                                  }, child: const Text("Edit",style: TextStyle(color: Colors.white),)),
                                                ],
                                              ),
                                            );
                                          });
                                        }, icon: const Icon(Icons.edit)),
                                        const SizedBox(width: 20,),
                                        IconButton(onPressed: () {
                                          context.read<CounterCubit>().removeItem(
                                              index: i);
                                        }, icon: const Icon(Icons.delete)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                          ],
                        );
                      }) : const SizedBox(),
                ),
              ),
            );
          }
          else if (count is CounterError) {
            return Container();
          }
          else {
            return Container();
          }

        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:  Colors.deepPurpleAccent.withOpacity(0.2),
        elevation: 1,
        onPressed: (){
          showDialog(context: context, builder: (con){
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration:const InputDecoration(
                        hintText: "Please Enter List Items",
                        border: OutlineInputBorder(
                        )
                    ),
                    controller: context.read<CounterCubit>().text,
                  ),
                  const SizedBox(height: 40,),
                  ElevatedButton(onPressed: (){
                    Navigator.of(context).pop();
                    context.read<CounterCubit>().addItem(text: context.read<CounterCubit>().text.text);
                    context.read<CounterCubit>().text.clear();
                  }, child: const Text("Add",style: TextStyle(color: Colors.white),)),
                ],
              ),
            );
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}