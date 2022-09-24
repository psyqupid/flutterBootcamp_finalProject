
import 'package:final_projesi/cubit/yemekler_cubit.dart';
import 'package:final_projesi/entity/yemekler.dart';
import 'package:final_projesi/views/yemek_detay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YemekSayfasi extends StatefulWidget {
  const YemekSayfasi({Key? key}) : super(key: key);

  @override
  State<YemekSayfasi> createState() => _YemekSayfasiState();
}

class _YemekSayfasiState extends State<YemekSayfasi> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<YemeklerCubit>().yemekleriGetir();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
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
        child: BlocBuilder<YemeklerCubit,List<Yemekler>>(

            builder: (context, liste){
              if(liste.isNotEmpty){
                return ListView.builder(

                    itemCount: liste.length,
                    itemBuilder: (context, index){
                      var yemek= liste[index];
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  YemekDetay(yemek: yemek)));
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
                                  child: Text("${yemek.yemek_adi}", textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Reem Kufi Fun', fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold) ),
                                ),
                                Spacer(),
                                Text("${yemek.yemek_fiyat}₺",style: TextStyle(fontFamily: 'Reem Kufi Fun', fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),

                              ],
                            ),
                          ),
                        ),
                      );
                    });

              }else{
                return const Center(
                  child: Text("Yemekler Bekleniyor..."),
                );
              }
            }),
      ),
    );
  }
}
