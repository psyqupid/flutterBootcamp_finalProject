
import 'package:final_projesi/repository/nomnom_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YemekDetayCubit extends Cubit<void> {
  YemekDetayCubit(): super(0);

  var yrepo = NomNomRepo();

}