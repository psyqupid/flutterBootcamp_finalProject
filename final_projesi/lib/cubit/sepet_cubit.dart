
import 'package:final_projesi/entity/sepetteki_yemekler.dart';
import 'package:final_projesi/repository/nomnom_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SepetCubit extends  Cubit<List<sepetYemekler>> {
  SepetCubit():super(<sepetYemekler>[]);

  Future<void> sepettekiYemekler() async {
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php");
    var sorgu = {"kullanici_adi":"sonejder"};
    var cevap = await http.post(url, body: sorgu);
    var liste = <sepetYemekler>[];
    try {
      var decoded = json.decode(cevap.body)["sepet_yemekler"];
      decoded.forEach((key){
        liste.add(sepetYemekler.fromJson(key));
      });
    } catch(e) {
      print("empty");
    }
    emit(liste);
  }
}