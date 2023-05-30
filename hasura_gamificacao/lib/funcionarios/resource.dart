import 'package:shelf_modular/shelf_modular.dart';

import 'api/get_all_funcionarios.dart';

class DepartamentosResource extends Resource {
  @override
  List<Route> get routes => [
        Route.get('/funcionarios', getAllFuncionarios),
        Route.get('/funcionarios', insertFuncionarios),
        Route.get('/funcionarios', updateFuncionarios),
        Route.get('/funcionarios', deleteFuncionarios),
      ];
}
