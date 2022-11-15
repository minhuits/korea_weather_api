import '../models/models.dart';
import '../repository/repository.dart';

abstract class SuperFctRepository
    with WeatherRepository<ItemSuperFct, SuperFctModel> {}
