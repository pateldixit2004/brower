import 'package:flutter/foundation.dart';

class webprovider extends ChangeNotifier
{

   double i=0;
   void changeprogrees(double updated)
   {
     i=updated;
     notifyListeners();
   }
}