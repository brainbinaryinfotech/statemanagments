import 'dart:ffi';

import 'package:block_demo/Obx_demo/obxhome_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class ObxHomeScreen extends StatelessWidget {
   ObxHomeScreen({Key? key}) : super(key: key);

   ObxHomeController obxHomeController = Get.put(ObxHomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:const Text( "Obx Demo",),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent.withOpacity(0.2)
      ),
      body: Center(
        child: Obx(
      () {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      height: 600,
                      child: (obxHomeController.listItems != null && obxHomeController.listItems != [] &&
                          obxHomeController.listItems.isNotEmpty) ? ListView.builder(
                          itemCount: obxHomeController.listItems.length,
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
                                        Text(obxHomeController.listItems[i].toString()),
                                        const Spacer(),
                                        Row(
                                          children: [
                                            IconButton(onPressed: () {
                                              obxHomeController
                                                  .text.value.text = obxHomeController.listItems[i];
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
                                                          controller:    obxHomeController
                                                              .text.value
                                                      ),
                                                      const SizedBox(height: 40,),
                                                      ElevatedButton(onPressed: () {
                                                        Navigator.of(context).pop();
                                                        obxHomeController
                                                            .editItem(text:    obxHomeController
                                                            .text.value.text, index: i);
                                                        obxHomeController
                                                            .text
                                                            .value.clear();
                                                      }, child: const Text("Edit",style: TextStyle(color: Colors.white),)),
                                                    ],
                                                  ),
                                                );
                                              });
                                            }, icon: const Icon(Icons.edit)),
                                            const SizedBox(width: 20,),
                                            IconButton(onPressed: () {
                                              obxHomeController.removeItem(
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
                  obxHomeController.loader.value ?const CircularProgressIndicator():const SizedBox(),
                ],
              );
            }
        ),
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
                    controller: obxHomeController.text.value,
                  ),
                  const SizedBox(height: 40,),
                  ElevatedButton(onPressed: (){
                    Navigator.of(context).pop();
                    obxHomeController.addItem(text: obxHomeController.text.value.text);
                    obxHomeController.text.value.clear();
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
