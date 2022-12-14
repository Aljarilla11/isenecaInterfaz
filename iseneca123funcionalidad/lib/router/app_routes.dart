
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class AppRoutes {
  static const initialRoute = 'home';

      static Map<String, Widget Function(BuildContext)> getAppRoutes(){
        Map<String, Widget Function(BuildContext)> appRoutes = {};
         appRoutes.addAll({'home' : (BuildContext context) => const HomeScreen()});
      
          return appRoutes;
        }
}    
