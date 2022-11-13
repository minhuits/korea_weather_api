import '../models/response/super_fct/super_fct_model.dart';
import '../repository/repository.dart';

abstract class SuperFctRepository
    with WeatherRepository<ItemSuperFct, SuperFctModel> {}
