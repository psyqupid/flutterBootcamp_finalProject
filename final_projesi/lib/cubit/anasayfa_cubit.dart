
import 'package:final_projesi/entity/yemekler.dart';
import 'package:final_projesi/repository/nomnom_repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<List<Yemekler>> {
  AnasayfaCubit(): super(<Yemekler>[]);

  var yrepo = NomNomRepo();


}