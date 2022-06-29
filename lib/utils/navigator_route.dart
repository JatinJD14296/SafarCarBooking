
import '../main.dart';
import '../screens/dashboard_screen/dashboard_screen.dart';
import '../screens/log_in_screen/log_in_screen.dart';
import '../screens/vendor_registration/vendor_registration_screen.dart';

const String rootScreen = "/";
const String loginScreen = "LogInScreen";
const String dashboardScreen = "DashboardScreen";
const String vendorRegistration = "VendorRegistration";
// const String carRegistration = "CarRegistration";
// const String carListScreen = "CarListScreen";

Map<String, WidgetBuilder> routes = {
  rootScreen: (context) => MyApp(),
  loginScreen: (context) => LogInScreen(),
  dashboardScreen: (context) => DashBoardScreen(),
  vendorRegistration: (context) => VendorRegistration(),
  // carRegistration: (context) => CarRegistration(),
  // carListScreen: (context) => CarListScreen(),
};
