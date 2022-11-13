import '../models/response/fct/fct_model.dart';
import '../repository/repository.dart';

abstract class FctRepository with WeatherRepository<ItemFct, FctModel> {}
