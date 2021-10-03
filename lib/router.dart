import 'package:auto_route/auto_route.dart';
import 'package:mb_circuits/pages/circuits_page.dart';
import 'package:mb_circuits/pages/add_circuit_page.dart';
import 'package:mb_circuits/pages/view_circuit_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: CircuitsPage, initial: true),
    AutoRoute(page: AddCircuitPage, path: '/:boardVersion/add'),
    AutoRoute(page: ViewCircuitsPage, path: '/:boardVersion/:uid'),
  ],
)
class $AppRouter {}
