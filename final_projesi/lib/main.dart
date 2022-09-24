
import 'package:final_projesi/cubit/anasayfa_cubit.dart';
import 'package:final_projesi/cubit/restoranlar_cubit.dart';
import 'package:final_projesi/cubit/sepet_cubit.dart';
import 'package:final_projesi/cubit/yemek_detay_cubit.dart';
import 'package:final_projesi/cubit/yemekler_cubit.dart';
import 'package:final_projesi/views/anasayfa.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AnasayfaCubit()),
          BlocProvider(create: (context) => RestoranlarCubit()),
          BlocProvider(create: (context) => SepetCubit()),
          BlocProvider(create: (context) => YemekDetayCubit()),
          BlocProvider(create: (context) => YemeklerCubit()),
          /*BlocProvider(create: (context) => AnasayfaCubit()),
          BlocProvider(create: (context) => RestoranlarCubit()),
          BlocProvider(create: (context) => SepetCubit()),
          BlocProvider(create: (context) => YemekDetayCubit()),
          BlocProvider(create: (context) => YemeklerCubit()),

           */

        ],
        child: MaterialApp(
      title: 'Nom Nom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Bangers-Regular',

        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
              fontFamily: 'Bangers-Regular'
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const Anasayfa(),
    ),
        );
    
    
  }
}

