import 'package:shelf_modular/shelf_modular.dart';

import 'api/get_all_departamentos.dart';
import 'api/insert_departamentos.dart';
import 'api/delete_departamentos.dart';
import 'api/update_departamentos.dart';

class DepartamentosResource extends Resource {
  @override
  List<Route> get routes => [
        Route.get('/departamentos', getAllDepartamentos),
        Route.post('/departamentos', insertDepartamento),
        Route.put('/departamentos', updateDepartamento),
        Route.delete('/departamentos', deleteDepartamento),
      ];
}
