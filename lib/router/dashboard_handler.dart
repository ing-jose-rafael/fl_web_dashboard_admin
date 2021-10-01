import 'package:admin_dashboard/ui/views/users_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';

import 'package:admin_dashboard/ui/views/categories_view.dart';
import 'package:admin_dashboard/ui/views/blank_view.dart';
import 'package:admin_dashboard/ui/views/icons_view.dart';
import 'package:admin_dashboard/ui/views/dashboard_views.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(handlerFunc: (context, parms) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false).setCurrentPage(Flurorouter.dashboardRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return DashboardView();
    } else {
      return LoginView();
    }
  });

  static Handler icons = Handler(handlerFunc: (context, parms) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false).setCurrentPage(Flurorouter.iconsRoute);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return IconsView();
    else
      /**aca si no esta autenticado puedo mandar un 404 */
      return LoginView();
  });

  static Handler blank = Handler(handlerFunc: (context, parms) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false).setCurrentPage(Flurorouter.blankRoute);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return BlankView();
    else
      /**aca si no esta autenticado puedo mandar un 404 */
      return LoginView();
  });

  static Handler category = Handler(handlerFunc: (context, parms) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false).setCurrentPage(Flurorouter.categoryRoute);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return CategoriesView();
    else
      /**aca si no esta autenticado puedo mandar un 404 */
      return LoginView();
  });
  static Handler customers = Handler(handlerFunc: (context, parms) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false).setCurrentPage(Flurorouter.customersRoute);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return UsersView();
    else
      /**aca si no esta autenticado puedo mandar un 404 */
      return LoginView();
  });
}
