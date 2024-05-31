import 'package:block_demo/GetxDemo/get_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';


class GetxHomeScreen extends StatelessWidget {
   GetxHomeScreen({Key? key}) : super(key: key);


   GetHomeController getHomeController = Get.put(GetHomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:const Text( "Getx Demo",),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent.withOpacity(0.2)
      ),
      body: Center(
        child: GetBuilder<GetHomeController>(
          id: "list",
          builder: (con) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    height: 600,
                    child: (getHomeController.listItems != null && getHomeController.listItems != [] &&
                        getHomeController.listItems.isNotEmpty) ? ListView.builder(
                        itemCount: getHomeController.listItems.length,
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
                                      Text(getHomeController.listItems[i].toString()),
                                      const Spacer(),
                                      Row(
                                        children: [
                                          IconButton(onPressed: () {
                                           getHomeController
                                                .text.text = getHomeController.listItems[i];
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
                                                      controller:    getHomeController
                                                          .text
                                                    ),
                                                    const SizedBox(height: 40,),
                                                    ElevatedButton(onPressed: () {
                                                      Navigator.of(context).pop();
                                                      getHomeController
                                                          .editItem(text:    getHomeController
                                                          .text.text, index: i);
                                                      getHomeController
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
                                            getHomeController.removeItem(
                                                index: i);
                                          }, icon: const Icon(Icons.delete)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20,)
                            ],
                          );
                        }) : const SizedBox(),
                  ),
                ),
                getHomeController.loader ?const CircularProgressIndicator():const SizedBox(),
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
                    controller: getHomeController.text,
                  ),
                  const SizedBox(height: 40,),
                  ElevatedButton(onPressed: (){
                    Navigator.of(context).pop();
                   getHomeController.addItem(text: getHomeController.text.text);
                    getHomeController.text.clear();
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
