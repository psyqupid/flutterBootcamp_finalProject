
import 'package:final_projesi/repository/nomnom_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestoranlarCubit extends Cubit<void> {
  RestoranlarCubit(): super(0);

  var yrepo = NomNomRepo();

}