import '../models/response/super_nct/super_nct_model.dart';
import '../repository/repository.dart';

abstract class SuperNctRepository
    with WeatherRepository<ItemSuperNct, SuperNctModel> {}
