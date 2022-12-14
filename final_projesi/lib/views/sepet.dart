
import 'package:final_projesi/cubit/yemekler_cubit.dart';
import 'package:final_projesi/cubit/sepet_cubit.dart';
import 'package:final_projesi/entity/sepetteki_yemekler.dart';

import 'package:final_projesi/entity/yemekler.dart';
import 'package:final_projesi/views/yemek_detay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'dart:convert';
import 'package:http/http.dart' as http;


class SepetSayfasi extends StatefulWidget {
  const SepetSayfasi({Key? key}) : super(key: key);

  @override
  State<SepetSayfasi> createState() => _SepetSayfasiState();
}

class _SepetSayfasiState extends State<SepetSayfasi> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SepetCubit>().sepettekiYemekler();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.red,
        ),
        backgroundColor: Colors.amber,
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.line_weight))
        ],
        title: Text("NomNom", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Bangers', fontSize: 30, color: Colors.red),),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/original.jpg'),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.deepOrangeAccent.withOpacity(0.7), BlendMode.dstATop),
          ),
        ),
        child: BlocBuilder<SepetCubit,List<sepetYemekler>>(
            builder: (context, liste){
              if(liste.isNotEmpty){
                return ListView.builder(
                    itemCount: liste.length,
                    itemBuilder: (context, index){
                      var yemek= liste[index];
                      var fiyat = int.parse(yemek.yemek_fiyat) * int.parse(yemek.yemek_siparis_adet);
                      return GestureDetector(
                        onTap: (){
                          print("${yemek.yemek_adi}");
                        },
                        child: Card(
                          color: Colors.amber.withOpacity(0.8),
                          elevation: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.network('http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}', scale: 5),

                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text("${yemek.yemek_adi}", textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Reem Kufi Fun', fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),
                                ),
                                Spacer(),
                                Text("Adet: ${yemek.yemek_siparis_adet}", textAlign: TextAlign.center, style: TextStyle(color: Colors.black),),
                                Spacer(),
                                Text("${fiyat}???"),
                                IconButton(onPressed: () {
                                  var sorgu = {"sepet_yemek_id": yemek.sepet_yemek_id,
                                    "kullanici_adi": yemek.kullanici_adi,};
                                  var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php");
                                  var cevap =  http.post(url, body: sorgu);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SepetSayfasi()),
                                  );

                                }

                                , icon: Icon(Icons.delete))

                              ],
                            ),
                          ),
                        ),
                      );
                    });

              }else{
                return  Center(
                  child: Card(
                    color: Colors.amber,
                    elevation: 0,
                    child: Text("Sepetiniz Bo?? :(",style: TextStyle(fontFamily: 'Reem Kufi Fun', fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),),
                  ),
                );
              }
            }),
      ),
    );
  }
}
