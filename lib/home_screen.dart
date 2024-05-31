import 'package:block_demo/GetxDemo/get_home_screen.dart';
import 'package:block_demo/Obx_demo/obx_home_screen.dart';
import 'package:block_demo/bloc_demo/bloc_home_screen.dart';
import 'package:block_demo/provider_demo/provider_notifier.dart';
import 'package:block_demo/provider_demo/provider_screen.dart';
import 'package:block_demo/riverpod_demo/riverpod_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as r;
import 'package:provider/provider.dart';

import 'bloc_demo/bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:const Text( "Index",),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent.withOpacity(0.2)
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return GetxHomeScreen();
                }));
              },
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                color:  Colors.deepPurpleAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: const Text("Getx Demo"),
              ),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return ObxHomeScreen();
                }));
              },
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                color:  Colors.deepPurpleAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: const Text("Obx Demo"),
              ),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return BlocProvider(create:(context) => CounterCubit(),
                    child: const BlocHomePage(),
                  );
                }));
              },
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color:  Colors.deepPurpleAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: const Text("Bloc Demo"),
              ),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return  MultiProvider(
                    providers: [
                      ChangeNotifierProvider(create: (_) => ProviderClassDemo()),
                    ],
                    child:const ProviderHomeScreen(),

                  );
                }));

              },
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color:  Colors.deepPurpleAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: const Text("Provider Demo"),
              ),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return   r.ProviderScope(
                    child:RiverpodHomeScreen(),
                  );
                }));

              },
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color:  Colors.deepPurpleAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: const Text("River pod Demo"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
