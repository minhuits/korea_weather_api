import '../models/response/fct_version/fct_version_model.dart';
import '../repository/repository.dart';

abstract class FctVersionRepository
    with VersionRepository<ItemFctVersion, FctVersionModel> {}
