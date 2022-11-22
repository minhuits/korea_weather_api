import '../models/models.dart';
import '../repository/repository.dart';

abstract class SuperNctRepository
    with WeatherRepository<ItemSuperNct, SuperNctModel> {}
