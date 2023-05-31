import 'package:shelf_modular/shelf_modular.dart';

import 'api/delete_Funcionarios.dart';
import 'api/get_all_funcionarios.dart';
import 'api/insert_Funcionarios.dart';
import 'api/update_Funcionarios.dart';

class DepartamentosResource extends Resource {
  @override
  List<Route> get routes => [
        Route.get('/funcionarios', getAllFuncionarios),
        Route.get('/funcionarios', insertFuncionario),
        Route.get('/funcionarios', updateFuncionario),
        Route.get('/funcionarios', deleteFuncionario),
      ];
}
