

import 'network/firestore_instance.dart';
import 'utils/navigator_route.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FireBaseDatabaseInstance.createReference();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: rootScreen,
      // home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Screen.setScreenSize(context);
    return SplashScreen();
  }
}
