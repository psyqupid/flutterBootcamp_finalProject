import 'package:final_projesi/cubit/yemekler_cubit.dart';
import 'package:final_projesi/entity/yemekler.dart';
import 'package:final_projesi/views/sepet.dart';
import 'package:final_projesi/views/yemek_sayfas%C4%B1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;

class YemekDetay extends StatefulWidget {
  Yemekler yemek;
  var adet=0;

  YemekDetay({required this.yemek});

  @override
  State<YemekDetay> createState() => _YemekDetayState();
}

class _YemekDetayState extends State<YemekDetay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NomNom", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Bangers', fontSize: 30, color: Colors.red),),iconTheme: IconThemeData(
        color: Colors.red,
      ),
        backgroundColor: Colors.amber,
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.line_weight))
        ],),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/original.jpg'),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.deepOrangeAccent.withOpacity(0.7), BlendMode.dstATop),
          ),
        ),
        child: Center(
          child: SizedBox(
            width: 300,
            height: 600,
            child: Card(
              color: Colors.amber.withOpacity(0.1),

              child: Column(
                children: [
                  Image.network('http://kasimadalan.pe.hu/yemekler/resimler/${widget.yemek.yemek_resim_adi}', scale: 1),
                  Text("${widget.yemek.yemek_adi}",style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                  Text("${widget.yemek.yemek_fiyat}₺",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: (){
                        setState(() {
                          widget.adet-=1;
                          widget.adet = [0, widget.adet].reduce(max);
                        }); }, child: Icon(Icons.remove), style: ElevatedButton.styleFrom(primary: Colors.amber),),
                      Padding(
                        padding: const EdgeInsets.only(left: 5,
                                                       right:5),
                        child: Text("${widget.adet}",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      ),
                      ElevatedButton(onPressed: (){
                        setState(() {
                          widget.adet+=1;
                        }); }, child: Icon(Icons.add), style: ElevatedButton.styleFrom(primary: Colors.amber),),
                    ],
                  ),
                  ElevatedButton(onPressed: () async {
                    var siparis = {"yemek_adi": widget.yemek.yemek_adi,
                                   "yemek_resim_adi": widget.yemek.yemek_resim_adi,
                                   "yemek_fiyat": widget.yemek.yemek_fiyat,
                                   "yemek_siparis_adet": widget.adet.toString(),
                                   "kullanici_adi": "sonejder",};
                    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php");

                    var cevap = await http.post(url, body: siparis);

                  }, child: Text("Sepete Ekle",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), ),style: ElevatedButton.styleFrom(primary: Colors.amber),),
                  ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SepetSayfasi()),
                    );
                  },
                      style: ElevatedButton.styleFrom(primary: Colors.red), child: Text("Sepete Git",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
                ],
              ),
            ),
          ),

        ),
      ),
    );
  }
}


//class YemekDetay extends StatefulWidget {
//  Yemekler


 /* @override
  State<YemekDetay> createState() => _YemekDetayState();
}

class _YemekDetayState extends State<YemekDetay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("detay"),),
      body: BlocBuilder<YemeklerCubit,List<Yemekler>>( builder: (context, liste){
        return Card(
          child: Row(
            children: [
              //Image.network('http://kasimadalan.pe.hu/yemekler/resimler/${}', scale: 5),
            ],
          ),
        );
      }),
    );
  }*/



