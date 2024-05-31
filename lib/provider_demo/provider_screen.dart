import 'package:block_demo/provider_demo/provider_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';


class ProviderHomeScreen extends StatelessWidget {
  const ProviderHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title:const Text( "Provider Demo",),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent.withOpacity(0.2)
      ),
      body: Consumer<ProviderClassDemo>(
        builder: (context,themeProvider, child) {
          return Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    height: 600,
                    child: (context.read<ProviderClassDemo>().listItems != null && context.read<ProviderClassDemo>().listItems != [] &&
                        context.read<ProviderClassDemo>().listItems.isNotEmpty) ? ListView.builder(
                        itemCount: context.read<ProviderClassDemo>().listItems.length,
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
                                      Text(context.read<ProviderClassDemo>().listItems[i].toString()),
                                      const Spacer(),
                                      Row(
                                        children: [
                                          IconButton(onPressed: () {
                                            context.read<ProviderClassDemo>()
                                                .text.text = context.read<ProviderClassDemo>().listItems[i];
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
                                                        controller: context.read<ProviderClassDemo>().text
                                                    ),
                                                    const SizedBox(height: 40,),
                                                    ElevatedButton(onPressed: () {
                                                      Navigator.of(context).pop();
                                                      context.read<ProviderClassDemo>()
                                                          .editItem(text:     context.read<ProviderClassDemo>()
                                                          .text.text, index: i);
                                                      context.read<ProviderClassDemo>()
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
                                            context.read<ProviderClassDemo>().removeItem(
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
                context.read<ProviderClassDemo>().loader ?const CircularProgressIndicator():const SizedBox(),
              ],
            ),
          );
        }
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
                    controller:  context.read<ProviderClassDemo>().text,
                  ),
                  const SizedBox(height: 40,),
                  ElevatedButton(onPressed: (){
                    Navigator.of(context).pop();
                    context.read<ProviderClassDemo>().addItem(text:  context.read<ProviderClassDemo>().text.text);
                    context.read<ProviderClassDemo>().text.clear();
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
