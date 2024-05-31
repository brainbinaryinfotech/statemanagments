import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodHomeScreen extends ConsumerStatefulWidget {
   RiverpodHomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RiverpodHomeScreen> createState() => _RiverpodHomeScreenState();
}

class _RiverpodHomeScreenState extends ConsumerState<RiverpodHomeScreen> with ChangeNotifier {
  final counterProvider = StateProvider((ref) => 0);
  final text = StateProvider((ref) => TextEditingController());
  final listItems = StateProvider((ref) => []);
  final loader = StateProvider((ref) => false);

  addItem({required String text,required WidgetRef ref }) {
    ref.read(loader.notifier).state = true;

    ref.read(listItems.notifier).state.add(text);
    ref.read(loader.notifier).state = false;
notifyListeners();
    setState(() {

    });
  }

  removeItem({required int index,required WidgetRef ref}) {
    ref.read(loader.notifier).state = true;

    ref.read(listItems.notifier).state.removeAt(index);
    ref.read(loader.notifier).state = false;

    notifyListeners();
    setState(() {

    });
  }

  editItem({required String text, required int index,required WidgetRef ref}) {
    ref.read(loader.notifier).state = true;

    ref.read(listItems.notifier).state.removeAt(index);
    ref.read(listItems.notifier).state.insert(index, text);

    ref.read(loader.notifier).state = false;
    notifyListeners();
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context,) {
    return  Consumer(
      builder: (context,ref, _) {
        return Scaffold(
          appBar: AppBar(
              title:const Text( "River pod Demo",),
              centerTitle: true,
              backgroundColor: Colors.deepPurpleAccent.withOpacity(0.2)
          ),
          body: Center(
            child:Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    height: 600,
                    child: (ref.watch(listItems) != null && ref.watch(listItems)  != [] &&
                        ref.watch(listItems).isNotEmpty) ? ListView.builder(
                        itemCount:  ref.read(listItems.notifier).state.length,
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
                                      Text( ref.watch(listItems) [i].toString()),
                                      const Spacer(),
                                      Row(
                                        children: [
                                          IconButton(onPressed: () {
                                            ref.read(text.notifier).state
                                                .text = ref.watch(listItems) [i];
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
                                                        controller:     ref.read(text.notifier).state
                                                    ),
                                                    const SizedBox(height: 40,),
                                                    ElevatedButton(onPressed: () {
                                                      Navigator.of(context).pop();

                                                      editItem(text:     ref.read(text.notifier).state
                                                          .text, index: i,ref: ref);
                                                      ref.read(text.notifier).state
                                                          .clear();
                                                    }, child: const Text("Edit",style: TextStyle(color: Colors.white),)),
                                                  ],
                                                ),
                                              );
                                            });
                                          }, icon: const Icon(Icons.edit)),
                                          const SizedBox(width: 20,),
                                          IconButton(onPressed: () {
                                            removeItem(
                                                index: i,ref: ref);
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
                ref.read(loader.notifier).state ?const CircularProgressIndicator():const SizedBox(),
              ],
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
                        controller:      ref.read(text.notifier).state,
                      ),
                      const SizedBox(height: 40,),
                      ElevatedButton(onPressed: (){
                        Navigator.of(context).pop();
                        addItem(text:  ref.read(text.notifier).state.text, ref: ref);
                        ref.read(text.notifier).state.clear();
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
    );
  }
}
