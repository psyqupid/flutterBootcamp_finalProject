
import 'package:final_projesi/entity/yemekler.dart';
import 'package:final_projesi/repository/nomnom_repo.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class YemeklerCubit extends Cubit<List<Yemekler>> {
  YemeklerCubit():super(<Yemekler>[]);

  var yrepo = NomNomRepo();
  var refYemekler = FirebaseDatabase.instance.ref().child("yemekler");


  Future<void> yemekleriGetir() async {
    refYemekler.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;
      if(gelenDegerler != null){
        var liste = <Yemekler>[];
        print(gelenDegerler);
        gelenDegerler.forEach((key){
          var yemek = Yemekler.fromJson(key);
          liste.add(yemek);
        });
        emit(liste);

      }else{
        print("no data available");
      }

    });

  }
}