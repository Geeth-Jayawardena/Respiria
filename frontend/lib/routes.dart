import 'package:auto_route/auto_route.dart';
import 'package:resperia/home__screen.dart';
import 'package:resperia/ui/auth/login_screen.dart';
import 'package:resperia/ui/auth/register_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      page: HomeScreen,
      initial: true,
    ),
    AutoRoute(
      page: LoginScreen,
    ),
    AutoRoute(
      page: RegisterScreen,
    ),
    RedirectRoute(path: '*', redirectTo: '/'),
  ],
  replaceInRouteName: 'Page|Screen|Dialog,Route',
)
class $AppRouter {}
